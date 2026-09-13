#!/bin/bash
set -euo pipefail

root=$(cd "$(dirname "$0")" && pwd)
bin_dir="${XDG_BIN_HOME:-$HOME/.local/bin}"
unit_dir="${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user"

install -Dm755 "$root/audio-idle-inhibit" "$bin_dir/audio-idle-inhibit"
install -Dm644 "$root/audio-idle-inhibit.service" "$unit_dir/audio-idle-inhibit.service"

systemctl --user daemon-reload
systemctl --user enable --now audio-idle-inhibit.service

echo "Installed and started audio-idle-inhibit.service"
systemctl --user --no-pager --full status audio-idle-inhibit.service || true
