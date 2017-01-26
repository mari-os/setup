# /etc/profile.d/proxy.csh - export proxy settings

set networkfile=/etc/sysconfig/network
if ( -f $networkfile && -s $networkfile ) then
        eval `sed -ne 's/^\(HTTP_PROXY\|HTTPS_PROXY\|FTP_PROXY\|NO_PROXY\)=\([^=]*\)$/setenv \1 \2;/pg' $networkfile`
endif

unsetenv networkfile

if ( $?HTTP_PROXY ) then
    setenv http_proxy $HTTP_PROXY
endif

if ( $?HTTPS_PROXY ) then
    setenv https_proxy $HTTPS_PROXY
endif

if ( $?FTP_PROXY ) then
    setenv ftp_proxy $FTP_PROXY
endif

if ( $?NO_PROXY ) then
    setenv no_proxy $NO_PROXY
endif
