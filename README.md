# omarchy-audio-idle-inhibit

Keep an [Omarchy](https://omarchy.org/) session awake while audio is playing.

Omarchy locks after a few minutes without input and then blanks the display.
If the default sink is HDMI or DisplayPort, that blank also stops playback
from players like [CLIAMP](https://cliamp.stream/).

This user service watches PipeWire for unmuted, uncorked sink inputs and
toggles Omarchy's stay-awake flag for as long as something is actually
playing. Pause or stop the music and the normal idle timers come back.

## Requirements

- Omarchy (it writes `~/.local/state/omarchy/indicators/stay-awake`)
- PipeWire with `pactl`
- `jq`
- systemd user session

## Install

```bash
git clone git@github.com:johnwlockwood/omarchy-audio-idle-inhibit.git
cd omarchy-audio-idle-inhibit
./install.sh
```

That copies the script to `~/.local/bin/audio-idle-inhibit`, installs the
user unit, and starts it.

## Uninstall

```bash
./uninstall.sh
```

## Manual stay-awake

Omarchy's existing toggle still works: **Super+Ctrl+I**, or
`omarchy toggle idle`. If you already turned stay-awake on by hand, this
service leaves that choice alone when playback stops.

## Logs

```bash
journalctl --user -u audio-idle-inhibit.service -f
```
