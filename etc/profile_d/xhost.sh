# "$Id"
# Export Xauthority for non-root users.

if [ -z "$XAUTHORITY" -a -z "$SSH_TTY" -a ! -z "$DISPLAY" -a "$UID" -gt 14 ]; then
	export XAUTHORITY="$HOME/.Xauthority"
fi
