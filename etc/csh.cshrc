# $Id$

if ($?prompt) then
	if ($?tcsh) then
		set prompt='[%n@%m %c]$ ' 
	else
		set prompt=\[`id -nu`@`hostname -s`\]\$\ 
	endif
endif

test -d /etc/profile.d
if ($status == 0) then
	set nonomatch
	foreach i ( /etc/profile.d/*.csh )
		test -f $i
		if ($status == 0) then
			source $i
		endif
	end
	unset i nonomatch
endif
