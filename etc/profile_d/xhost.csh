# "$Id"
# Export Xauthority for non-root users.

if (! $?XAUTHORITY) then
	if ($?DISPLAY) then
		if (! $?SSH_TTY) then
			if ( `id -u` >= 14 ) then
				setenv XAUTHORITY $HOME/.Xauthority
			endif
		endif
	endif
endif
