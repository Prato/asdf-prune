function asdf_prune
    set dry_run 0
    set plugins

    for arg in $argv
        switch $arg
            case "--dry-run"
                set dry_run 1
            case "-a" "--all"
                set plugins (asdf plugin list)
            case "-h" "--help"
                echo "Usage: asdf_prune [-a|--all] [--dry-run] [plugin1 plugin2 ...]"
                echo
                echo "Options:"
                echo "  -a, --all        Prune all plugins"
                echo "  --dry-run        Show what would be removed without deleting"
                echo "  -h, --help       Show this help message"
                return 0
            case "*"
                set plugins $plugins $arg
        end
    end

    if test (count $plugins) -eq 0
        echo "Usage: asdf_prune [-a|--all] [--dry-run] [plugin1 plugin2 ...]"
        return 1
    end

    for lang in $plugins
        set install_dir "$HOME/.asdf/installs/$lang"

        if not test -d $install_dir
            echo "📂 No installs found for $lang."
            continue
        end

        set current_versions (asdf current $lang 2>/dev/null | awk '{ print $2 }' | string trim)

        if test -z "$current_versions"
            echo "⚠️  No current version found for $lang."
            continue
        end

        echo "=== $lang: Keeping version(s): $current_versions ==="

        for path in $install_dir/*
            set ver (basename $path)

            set keep 0
            for curr in $current_versions
                if test "$ver" = "$curr"
                    set keep 1
                    break
                end
            end

            if test $keep -eq 1
                continue
            end

            if test $dry_run -eq 1
                echo "[DRY-RUN] Would remove: $ver"
            else
                read -P "🗑️  Remove $lang version $ver? [Y/n] " confirm
                switch $confirm
                    case "" "y" "Y"
                        echo "👉 Deleting $ver..."
                        rm -rf "$path"
                    case "*"
                        echo "❌ Skipped $ver"
                end
            end
        end
    end
end
