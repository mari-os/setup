# $Id$
# System profile for basic ALT Linux system.
#
# It is recommended that this file be left unchanged to ease upgrades,
# and any local additions go into /etc/profile.d/ directory.

setenv PATH "/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/X11R6/bin"

# See also /etc/security/limits.conf
limit coredumpsize 0
umask 022

setenv HOSTNAME `/bin/hostname`
set history=9999

if ( -d /etc/profile.d ) then
	set nonomatch
	foreach i ( /etc/profile.d/*.csh )
		if ( -f $i && -r $i && -x $i && -s $i && ! -l $i ) then
			source $i
		endif
	end
	unset i nonomatch
endif
