# /etc/profile.d/lang.csh - set i18n stuff

set sourced=0

foreach file ($HOME/.i18n /etc/sysconfig/i18n)
    if ( $sourced == 0 && -f $file && -s $file ) then
        eval `sed -ne 's|^\([^#=]\+\)=\([^=]*\)$|setenv \1 \2;|pg' $file`
        set sourced=1
    endif
end

if ($sourced == 1) then
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
    if ( $?DISPLAY ) then
        if ( $?X11_NOT_LOCALIZED ) then
            if ( $X11_NOT_LOCALIZED == "yes" ) then
                set LANGUAGE="C"
            endif
        endif
    else
        if ( $?CONSOLE_NOT_LOCALIZED ) then
            if ( $CONSOLE_NOT_LOCALIZED == "yes" ) then
                set LANGUAGE="C"
            endif
        endif
    endif
    if ($?LANGUAGE && $?LANG) then
        if ($LANGUAGE == $LANG) then
            unsetenv LANGUAGE
        endif
    endif
    unsetenv SYSFONTACM
    unsetenv SYSFONT
endif

unsetenv sourced
