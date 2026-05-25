#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Please run as root: sudo ./uninstall.sh${NC}"
    exit 1
fi

rm -f /usr/local/bin/cors
rm -f /usr/local/share/man/man1/cors.1
rm -f /etc/bash_completion.d/cors

echo -e "${GREEN}✓ cors uninstalled successfully${NC}"
