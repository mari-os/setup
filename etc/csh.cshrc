if ($?prompt) then
	if ($?tcsh) then
		set prompt='[%n@%m %c]$ ' 
	else
		set prompt=\[`id -nu`@`hostname -s`\]\$\ 
	endif
endif
