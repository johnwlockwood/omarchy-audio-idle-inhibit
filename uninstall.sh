#!/bin/bash
set -euo pipefail

bin_dir="${XDG_BIN_HOME:-$HOME/.local/bin}"
unit_dir="${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user"
state_dir="${XDG_STATE_HOME:-$HOME/.local/state}/omarchy/indicators"

systemctl --user disable --now audio-idle-inhibit.service 2>/dev/null || true
rm -f "$unit_dir/audio-idle-inhibit.service"
rm -f "$bin_dir/audio-idle-inhibit"

if [[ -f $state_dir/audio-idle-inhibit ]]; then
  rm -f "$state_dir/audio-idle-inhibit" "$state_dir/stay-awake"
fi

systemctl --user daemon-reload
echo "Removed audio-idle-inhibit"
