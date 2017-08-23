# /etc/profile.d/0lang.csh - set i18n stuff

set sourced=0

if ($?LANG) then
    if ($LANG != "") then
        set sourced=1
    endif
endif

if (! $sourced) then
    foreach file ($HOME/.i18n /etc/sysconfig/i18n /etc/locale.conf)
        if ($sourced == 0 && -f $file && -s $file) then
            eval `sed -n 's|^\([^#=]\+\)=\([^=]*\)$|setenv \1 \2;|pg' $file`
            set sourced=1
        endif
    end
endif

if ($sourced) then
    if ($?LC_ALL && $?LANG) then
        if ($LC_ALL == $LANG) then
            unsetenv LC_ALL
        endif
    endif
    if ($?LINGUAS && $?LANG) then
        if ($LINGUAS == $LANG) then
            unsetenv LINGUAS
        endif
    endif
    if ($?LINGUAS && $?LANGUAGE) then
        if ($LINGUAS == $LANGUAGE) then
            unsetenv LINGUAS
        endif
    endif
    if ($?DISPLAY) then
        if ($?X11_NOT_LOCALIZED) then
            if ($X11_NOT_LOCALIZED == "yes") then
                set LANGUAGE="C"
            endif
        endif
    else
        if ($?CONSOLE_NOT_LOCALIZED) then
            if ($CONSOLE_NOT_LOCALIZED == "yes") then
                set LANGUAGE="C"
            endif
        endif
    endif
    if ($?LANGUAGE && $?LANG) then
        if ($LANGUAGE == "" || $LANGUAGE == $LANG) then
            unsetenv LANGUAGE
        endif
    endif
    if ($?LANGUAGE == 0 && $?LANG) then
        setenv LANGUAGE `grep -s ^${LANG}: /etc/sysconfig/langmap ||:`
    endif
    if ($?LANGUAGE && $?LANG) then
        if ($LANGUAGE == "" || $LANGUAGE == $LANG) then
            unsetenv LANGUAGE
        endif
    endif
    unsetenv SYSFONTACM
    unsetenv SYSFONT
endif

unsetenv sourced
