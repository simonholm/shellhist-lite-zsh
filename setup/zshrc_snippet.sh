# ShellHist Lite logger for Zsh

HIST_IGNORE_SPACE=1

autoload -Uz add-zsh-hook

log_shell_command() {
  local last_cmd="${1//'/''}"   # escape single quotes
  local cwd="${PWD//'/''}"
  local tty="$(tty 2>/dev/null || echo 'unknown')"

  if [[ -n "$last_cmd" ]]; then
    sqlite3 ~/.local/share/shellhist/history.db <<EOF
INSERT INTO history (timestamp, cmd, cwd, tty)
VALUES (strftime('%s','now'), '$last_cmd', '$cwd', '$tty');
EOF
  fi
}

zshaddhistory() {
  emulate -L zsh
  setopt extendedglob

  [[ "$1" == " "* ]] && return  # skip space-prefixed commands
  log_shell_command "$1"
}
