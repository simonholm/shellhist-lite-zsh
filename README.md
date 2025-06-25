# ShellHist Lite

A minimal, Termux-friendly shell history logger using SQLite + `fzf`.

## Features

- Logs every command with timestamp, path, and TTY
- Interactive fuzzy search of history
- No Rust or sync dependencies
- Fully works in Termux

## Setup

### 1. Install dependencies

```bash
pkg install sqlite fzf
```

### 2. Initialize the database

```bash
bash setup/initialize_db.sh
```

### 3. Add history logger to your `.bashrc`

```bash
cat setup/bashrc_snippet.sh >> ~/.bashrc
```

### 4. Use the fuzzy search

```bash
~/.local/bin/shist
```

---

## Notes

- Commands prefixed with a space are ignored (useful for secrets)
- Outputs selected command to terminal; run via `eval "$(shist)"` if you want to execute

MIT License
