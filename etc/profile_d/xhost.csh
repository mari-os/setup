# Export Xauthority for non-root users.

if (! $?XAUTHORITY && ! $?SSH_TTY && $?DISPLAY) then
	if ( `id -u` >= 14 ) then
		setenv XAUTHORITY $HOME/.Xauthority
	endif
endif
