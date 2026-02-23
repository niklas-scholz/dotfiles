# 🛠️ Niklas' Dotfiles

This is my personal dotfiles repository, managed using [chezmoi](https://www.chezmoi.io/). It contains configuration for tools, editors, and CLI utilities — everything **except** my macOS and Zsh setup, which are managed separately using [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager) [here](https://github.com/niklas-scholz/flakes/tree/main/darwin).

## 🚀 Getting Started

### 1. Install chezmoi

```sh
brew install chezmoi
```

### 2. Initialize and apply this repo

```sh
chezmoi init https://github.com/niklas-scholz/dotfiles.git
chezmoi apply
```

This will set up your home directory with the configuration defined in this repo.

## 🧠 How It Works

chezmoi manages dotfiles by maintaining a source directory (usually `~/.local/share/chezmoi`) and applying changes to your actual home directory
