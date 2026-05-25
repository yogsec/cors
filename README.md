Here's the complete `README.md` file for your repository:

```markdown
# cors - CORS Misconfiguration Scanner

A simple and fast tool to detect CORS misconfigurations in web applications.

## INSTALLATION

### Method 1: Automatic Installation (Recommended)

```bash
git clone https://github.com/yogsec/cors
cd cors
sudo chmod +x install.sh
sudo ./install.sh
```

### Method 2: Manual Installation

```bash
git clone https://github.com/yogsec/cors
cd cors
chmod +x cors
sudo cp cors /usr/local/bin/
```

### Verification

After installation, test if the tool is working:

```bash
cors -v
```

Expected output:
```
cors version: 1.0
```

## UNINSTALLATION

To completely remove cors from your system:

```bash
cd cors
sudo ./uninstall.sh
```

Or manually:

```bash
sudo rm -f /usr/local/bin/cors
sudo rm -f /usr/local/share/man/man1/cors.1
sudo rm -f /etc/bash_completion.d/cors
```

## HOW TO USE

### Basic Syntax

```
cors [OPTIONS]
```

### Available Options

| Option | Description |
|--------|-------------|
| -h, --help | Show help message |
| -u, --url URL | Check a single URL |
| -w, --wordlist FILE | Scan multiple URLs from a file |
| -o, --output FILE | Save results to a file |
| -c, --threads N | Number of concurrent threads (default: 10) |
| -v, --version | Show version information |

### Usage Examples

#### 1. Scan a Single URL

```bash
cors -u https://example.com
```

Output example:
```
[*] Checking: https://example.com
[!] https://example.com - Reflects origin in ACAO
[!] https://example.com - Credentials enabled
```

#### 2. Scan Multiple URLs from a File

First, create a file called `urls.txt` with one URL per line:

```
https://example.com
https://test.com/api
https://target.com
```

Then run:

```bash
cors -w urls.txt
```

#### 3. Save Results to a File

```bash
cors -w urls.txt -o results.txt
```

#### 4. Increase Scanning Speed with Threads

```bash
cors -w urls.txt -c 20
```

This uses 20 concurrent threads for faster scanning.

#### 5. Combine Multiple Options

```bash
cors -w urls.txt -o vulnerable.txt -c 30
```

#### 6. View Help

```bash
cors -h
```

or

```bash
cors --help
```

### Understanding the Output

When cors finds a vulnerability, it will show:

- `Wildcard (*) in ACAO` - The server accepts requests from any origin
- `Reflects origin in ACAO` - The server echoes back the Origin header
- `Unsafe methods: PUT/DELETE` - Dangerous HTTP methods are allowed
- `Wildcard in ACAH` - All headers are allowed
- `Credentials enabled` - Server allows sending credentials with requests

### Creating a URL List File

Create a text file with one URL per line:

```bash
nano urls.txt
```

Add your targets:

```
https://site1.com
https://site2.com/api/v1
https://site3.com/admin
https://site4.com:8080
```

Save and exit. Then run cors with this file.

### Tips for Best Results

1. Always use HTTPS URLs when possible
2. For large scans, use threads between 10-30 to avoid rate limiting
3. Save output to a file for later analysis
4. Run with sudo if you encounter permission issues

### Troubleshooting

**Problem:** `cors: command not found`

**Solution:** Reinstall the tool or use ./cors from the installation directory

**Problem:** `Error: File not found`

**Solution:** Check if the wordlist file exists in the current directory or provide full path

**Problem:** `Permission denied`

**Solution:** Run with sudo or ensure the script has execute permissions

## SYSTEM REQUIREMENTS

- Operating System: Linux (Kali Linux, Ubuntu, Debian, etc.)
- Dependencies: curl, bash
- Permissions: Root access for installation only

## FILE STRUCTURE

```
cors/
│
├── cors                    # Main executable script
├── install.sh              # Installation script
├── uninstall.sh            # Uninstallation script
├── README.md               # Documentation
├── LICENSE                 # License file
│
├── wordlists/              # Example wordlists folder
│   └── common.txt          # Example URL wordlist
│
├── examples/               # Usage examples
│   ├── single_url.sh       # Example: single URL scan
│   └── bulk_scan.sh        # Example: bulk scan with wordlist
│
└── .gitignore              # Git ignore file
```

## GETTING HELP

If you encounter issues or have questions:

- GitHub Issues: https://github.com/yogsec/cors/issues
- Author: yogsec
