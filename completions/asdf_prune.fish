complete -c asdf_prune -s a -l all -d "Prune all plugins"
complete -c asdf_prune -l dry-run -d "Simulate removal without deleting"
complete -c asdf_prune -l help -d "Show help"
complete -c asdf_prune -a "(asdf plugin list)" -d "ASDF plugin name"
