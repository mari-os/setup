# $Id$
# Set TMPDIR to ~/tmp create it if he not exist.

if ( -d ${HOME}/tmp && -w ${HOME}/tmp ) then
    setenv TMPDIR ${HOME}/tmp
    exit
endif

if ( `mkdir -p ${HOME}/tmp >&! /dev/null` ) then 
    setenv TMPDIR ${HOME}/tmp
    exit
endif

setenv TMPDIR ${HOME}/tmp
