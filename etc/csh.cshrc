# $Id$

if ($?prompt) then
	if ($?tcsh) then
		set prompt='[%n@%m %c]$ ' 
	else
		set prompt=\[`id -nu`@`hostname -s`\]\$\ 
	endif
endif

if ( -d /etc/profile.d ) then
	set nonomatch
	foreach i ( /etc/profile.d/*.csh )
		if ( -f $i && -r $i && -s $i ) then
			source $i
		endif
	end
	unset i nonomatch
endif
