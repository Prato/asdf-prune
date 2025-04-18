# 🧹 asdf_prune.fish

Clean up old versions installed by [asdf](https://asdf-vm.com) and keep only the ones currently in use.

---

## ✅ Features

- 🔍 **Dry run by default** – see what would be deleted
- 🧼 **Prune unused versions** – only keeps active versions
- 🧨 **Prune all plugins** with `-a`
- ⚙️ **Multi-plugin support** – `asdf_prune python nodejs`
- ❓ **Interactive confirmation**, defaulting to yes
- 🐟 **Pure Fish shell**, no Bash or external dependencies

---

## 📦 Installation

With [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install prato/asdf_prune
```

---

## 🛠 Usage

```fish
asdf_prune <plugin> [<plugin> ...]
asdf_prune -a        # Prune all installed plugins
asdf_prune -h        # Show help
```

## 💡 Example

```fish
asdf_prune python
```

```txt
=== python: Keeping version 3.12.3 ===
🗑️  Removing: 3.10.7
🗑️  Removing: 3.11.4

Continue? [Y/n]
```

## 🚫 Safety

 • Only removes versions not marked as current by asdf current
 • Skips plugins with no current version
 • Never touches .tool-versions or configuration
