#!/bin/bash

CYAN='\e[1;36m'
GREEN='\e[1;32m'
NC='\e[0m'

LATEST_VERSION=$(curl -s https://api.github.com/repos/1NoJoom/T.Sin/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
[ -z "$LATEST_VERSION" ] && LATEST_VERSION="latest"

curl -sL "https://github.com/1NoJoom/T.Sin/releases/latest/download/T.Sin" -o "/tmp/T.Sin" &
PID=$!

SPIN='-\|/'
i=0

while kill -0 $PID 2>/dev/null; do
    i=$(( (i+1) %4 ))
    printf "\r${CYAN}Downloading T.Sin ($LATEST_VERSION)... ${SPIN:$i:1}${NC}"
    sleep 0.1
done

printf "\r${GREEN}Downloading T.Sin ($LATEST_VERSION)... Done!  ${NC}\n"

mv "/tmp/T.Sin" "/usr/local/bin/T.Sin"
chmod +x "/usr/local/bin/T.Sin"

T.Sin
