# $Id$
# If TMPDIR is not defined, set it to ~/tmp and create it if required.

setenv createtmp 0

if ( ! $?TMPDIR ) then
    setenv createtmp 1
else
    if ( -z $TMPDIR ) then
        setenv createtmp 1
    else
        if ( (! -d $TMPDIR) || (! -w $TMPDIR) ) then
            setenv createtmp 1
	endif
    endif
endif

if ( $createtmp ) then
    if ( ! -d ${HOME}/tmp || ! -w ${HOME}/tmp ) then
        install -d -m700 -- ${HOME}/tmp >&! /dev/null
    endif
    if ( -d ${HOME}/tmp && -w ${HOME}/tmp ) then
        setenv TMPDIR ${HOME}/tmp
    endif
endif

unsetenv createtmp
