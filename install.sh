#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "Installing cors - CORS Scanner Tool"

if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Please run as root: sudo ./install.sh${NC}"
    exit 1
fi

# Copy to system bin
cp cors /usr/local/bin/
chmod +x /usr/local/bin/cors

# Create man page
mkdir -p /usr/local/share/man/man1/
cat > /usr/local/share/man/man1/cors.1 << 'EOF'
.TH CORS 1 "2024" "cors v1.0" "User Commands"
.SH NAME
cors \- CORS Misconfiguration Scanner
.SH SYNOPSIS
.B cors
[\fIOPTIONS\fR]
.SH DESCRIPTION
A simple and fast tool to detect CORS misconfigurations.
.SH OPTIONS
.TP
\fB\-h\fR, \fB\-\-help\fR
Show help
.TP
\fB\-u\fR, \fB\-\-url\fR \fIURL\fR
Check single URL
.TP
\fB\-w\fR, \fB\-\-wordlist\fR \fIFILE\fR
Scan URLs from file
.TP
\fB\-o\fR, \fB\-\-output\fR \fIFILE\fR
Save output
.TP
\fB\-c\fR, \fB\-\-threads\fR \fIN\fR
Thread count (default: 10)
.TP
\fB\-v\fR, \fB\-\-version\fR
Show version
.SH EXAMPLES
.B cors -u https://example.com
.P
.B cors -w urls.txt -o results.txt
.SH AUTHOR
yogsec
.SH REPORTING BUGS
https://github.com/yogsec/cors/issues
EOF

# Create bash completion
mkdir -p /etc/bash_completion.d/
cat > /etc/bash_completion.d/cors << 'EOF'
_cors_completion() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="-h --help -u --url -w --wordlist -o --output -c --threads -v --version"
    
    case "${prev}" in
        -u|--url|-w|--wordlist|-o|--output|-c|--threads)
            return 0
            ;;
    esac
    
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _cors_completion cors
EOF

echo -e "${GREEN}✓ cors installed successfully!${NC}"
echo ""
echo -e "${YELLOW}Usage:${NC}"
echo "  cors -u https://example.com"
echo "  cors -w urls.txt"
echo "  cors -h"
