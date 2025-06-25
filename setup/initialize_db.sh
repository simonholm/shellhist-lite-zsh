#!/data/data/com.termux/files/usr/bin/bash

mkdir -p ~/.local/share/shellhist

sqlite3 ~/.local/share/shellhist/history.db <<EOF
CREATE TABLE IF NOT EXISTS history (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  timestamp INTEGER,
  cmd TEXT,
  cwd TEXT,
  tty TEXT
);
EOF

echo "Initialized SQLite database at ~/.local/share/shellhist/history.db"
