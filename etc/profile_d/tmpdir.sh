# $Id$
# If TMPDIR is not defined, set it to ~/tmp and create the directory if required.

if [ -z "$TMPDIR" ] || [ ! -d "$TMPDIR" -o ! -w "$TMPDIR" ]; then
	if [ -d "$HOME/tmp" -a -w "$HOME/tmp" ]; then
		export TMPDIR="$HOME/tmp"
	elif install -d -m700 -- "$HOME/tmp" >/dev/null 2>&1; then
		if [ -d "$HOME/tmp" -a -w "$HOME/tmp" ]; then
			export TMPDIR="$HOME/tmp"
		fi
	fi
fi
