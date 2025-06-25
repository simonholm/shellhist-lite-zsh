# ShellHist Lite logger

export HISTCONTROL=ignorespace

log_shell_command() {
  local last_cmd="$(fc -ln -1 | sed 's/'\''/'\'\''/g')"
  local cwd="$(pwd | sed 's/'\''/'\'\''/g')"
  local tty="$(tty 2>/dev/null || echo 'unknown')"

  if [ -n "$last_cmd" ]; then
    sqlite3 ~/.local/share/shellhist/history.db <<EOF
INSERT INTO history (timestamp, cmd, cwd, tty)
VALUES (strftime('%s','now'), '$last_cmd', '$cwd', '$tty');
EOF
  fi
}

PROMPT_COMMAND="log_shell_command; $PROMPT_COMMAND"
