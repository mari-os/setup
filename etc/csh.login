# $Id$
# System profile for basic ALT Linux system.
#
# It is recommended that this file be left unchanged to ease upgrades,
# and any local additions go into /etc/profile.d/_local.csh.

setenv PATH "/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/X11R6/bin"

limit coredumpsize 0
umask 022

setenv HOSTNAME `/bin/hostname`
set history=9999

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
