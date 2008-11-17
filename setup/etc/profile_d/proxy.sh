# /etc/profile.d/proxy.sh - export proxy settings

networkfile=/etc/sysconfig/network

if [ -s "$networkfile" ]; then
    eval `egrep '^(HTTP_PROXY|HTTPS_PROXY|FTP_PROXY)=' "$networkfile"`
fi

unset networkfile

if [ -n "$HTTP_PROXY" ]; then
    http_proxy="$HTTP_PROXY"
    export http_proxy HTTP_PROXY
fi

if [ -n "$HTTPS_PROXY" ]; then
    https_proxy="$HTTPS_PROXY"
    export https_proxy HTTPS_PROXY
fi

if [ -n "$FTP_PROXY" ]; then
    ftp_proxy="$FTP_PROXY"
    export ftp_proxy FTP_PROXY
fi
