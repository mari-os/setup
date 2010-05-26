# If TMPDIR is not defined or is not a writable directory,
# set it to ~/tmp if the latter is a writable directory.

setenv settmp 0

if (! $?TMPDIR) then
    setenv settmp 1
else
    if ($TMPDIR == "") then
        setenv settmp 1
    else
        if ((! -d $TMPDIR) || (! -w $TMPDIR)) then
            setenv settmp 1
	endif
    endif
endif

if ($settmp) then
    if (-d ${HOME}/tmp && -w ${HOME}/tmp) then
        setenv TMPDIR ${HOME}/tmp
    else
        if (-d /tmp && -w /tmp) then
            setenv TMPDIR /tmp
	endif
    endif
endif

unsetenv settmp
