# ShellHist Lite (Zsh/Termux)

[![Shell](https://img.shields.io/badge/shell-zsh-blue.svg)](https://www.zsh.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A minimal, Termux-friendly shell history logger using SQLite + `fzf`.

---

## Features

- Logs every command with timestamp, path, and TTY
- Interactive fuzzy search of history
- No Rust or sync dependencies
- Fully works in Termux
- Works with both Bash and Zsh

---

## Setup

### 1. Install dependencies

    pkg install sqlite fzf

### 2. Initialize the database

    bash setup/initialize_db.sh

### 3. Add history logger to your shell config

#### For Bash:

    cat setup/bashrc_snippet.sh >> ~/.bashrc

#### For Zsh:

    cat setup/zshrc_snippet.sh >> ~/.zshrc

### 4. Use the fuzzy search

    ~/.local/bin/shist

---

## Notes

- Commands prefixed with a space are ignored (useful for secrets)
- Outputs the selected command to your terminal
- Run with `eval "$(shist)"` to execute directly
- Fully compatible with Termux

---

## License

MIT License
