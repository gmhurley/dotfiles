# dotfiles

My personal dotfiles for macOS. Managed with symlinks and Homebrew.

## What's in here

| Path | Description |
|------|-------------|
| `ghostty/config` | Ghostty terminal config — theme, font, quick terminal keybind |
| `starship/starship.toml` | Starship prompt — full path, git info, OS icon, command duration |
| `zsh/.zshrc` | Zsh config |
| `Brewfile` | All Homebrew packages and casks |
| `install.sh` | Setup script for new machines |

## Fresh machine setup

Make sure you have SSH access to GitHub set up first, then:

```bash
git clone git@github.com:gmhurley/dotfiles.git ~/repos/dotfiles
~/repos/dotfiles/install.sh
```

That will:
- Install Homebrew if not present
- Install all packages from the Brewfile
- Symlink all configs to their correct locations

## Updating

Since configs are symlinked, edits take effect immediately. Commit changes when you're happy with them:

```bash
cd ~/repos/dotfiles
git add .
git commit -m "description of change"
git push origin master
```

When installing new brew packages worth keeping, update the Brewfile:

```bash
brew bundle dump --force --file=~/repos/dotfiles/Brewfile
cd ~/repos/dotfiles
git add Brewfile
git commit -m "brewfile: add X"
git push origin master
```

## Stack

- **OS:** macOS
- **Terminal:** [Ghostty](https://ghostty.org)
- **Prompt:** [Starship](https://starship.rs) with a custom config based on [CoryCharlton/starship-configuration](https://github.com/CoryCharlton/starship-configuration)
- **Font:** JetBrainsMono Nerd Font
- **Shell:** zsh
- **Package manager:** [Homebrew](https://brew.sh)
