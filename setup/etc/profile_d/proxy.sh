# /etc/profile.d/proxy.sh - export proxy settings

if [ -s /etc/sysconfig/network ]; then
    eval `grep -E '^(HTTP_PROXY|HTTPS_PROXY|FTP_PROXY|NO_PROXY)=' /etc/sysconfig/network`
fi

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

if [ -n "$NO_PROXY" ]; then
    no_proxy="$NO_PROXY"
    export no_proxy NO_PROXY
fi
