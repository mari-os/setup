#!/bin/sh
# $Id$

if [ -z "$TMPDIR" ] || [ ! -d "$TMPDIR" ]; then
	if [ -s /etc/sysconfig/system ]; then
		. /etc/sysconfig/system
	fi
	unset f

	case "$SECURE_TMP" in
	[Nn][Oo]|0)
		;;
	*)
		# Set TMPDIR to ~/tmp and create it if directory does not exist.
		if [ -d "$HOME/tmp" -a -w "$HOME/tmp" ]; then
			export TMPDIR="$HOME/tmp"
		elif install -d -m700 -- "$HOME/tmp" >/dev/null 2>&1; then
			export TMPDIR="$HOME/tmp"
		fi
		;;
	esac
fi
