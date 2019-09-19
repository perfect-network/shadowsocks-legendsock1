#!/usr/bin/env bash
cd /usr/local
wget -O go.tar.gz https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
tar -zxf go.tar.gz
rm go.tar.gz

OLDPATH="$PATH"
PATH="$PATH:/usr/local/go/bin"

go get -u -v github.com/NetchX/shadowsocks-legendsock
cd ~/go/src/github.com/NetchX/shadowsocks-legendsock

go build -ldflags "-w -s"

mkdir -p /opt/shadowsocks-legendsock
cp shadowsocks-legendsock /opt/shadowsocks-legendsock
chmod +x /opt/shadowsocks-legendsock/shadowsocks-legendsock
cp scripts/systemd/shadowsocks-legendsock.service /etc/systemd/system
systemctl daemon-reload

rm -rf ~/go

PATH="$OLDPATH"
cd /usr/local
rm -rf go

exit 0
