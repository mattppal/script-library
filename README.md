# Script Organization System

A structured system for creating, managing, and executing Bash and UV Python scripts with consistent templates and easy discovery.

## Directory Structure

```
~/Developer/scripts/
├── bash/           # Bash-specific scripts
├── uv/             # UV Python scripts
├── utils/          # General utility scripts
├── system/         # System administration scripts
├── network/        # Network-related scripts
├── dev/            # Development workflow scripts
├── template.sh     # Template for Bash scripts
├── template-uv.py  # Template for UV Python scripts
├── script-index.sh # Lists all available scripts
├── new-script.sh   # Creates new scripts from templates
├── zsh-config.zsh  # ZSH configuration for the system
└── README.md       # System documentation
```

## ZSH Configuration

Add to your `~/.zshrc` file:

```bash
source ~/Developer/scripts/zsh-config.zsh
```

### Custom Installation Location

If installed elsewhere:

1. Update the path in `.zshrc`:
   ```bash
   source /path/to/your/scripts/zsh-config.zsh
   ```

2. Update paths in zsh-config.zsh:
   ```bash
   # Edit the file
   nano /path/to/your/scripts/zsh-config.zsh
   
   # Update all paths to match your location
   ```

3. Reload your configuration:
   ```bash
   source ~/.zshrc
   ```

## Creating Scripts

### Basic Usage

```bash
newscript <category> <script-name> [type]
```

Where:
- `<category>` is one of: bash, uv, utils, system, network, dev
- `<script-name>` is the name without extension
- `[type]` is optional: `bash` (default) or `uv`

### Examples

```bash
# New bash script in utils
newscript utils compress-images bash

# New UV Python script in dev
newscript dev git-stats uv

# New bash script (default type)
newscript system backup-config
```

## Script Templates

### Bash Template

```bash
#!/bin/bash
# Description: 
# Usage: 
# Author: yourusername
# Created: 2025-05-14

# Exit on error
set -e

# Script content here
main() {
  echo "Hello from bash script!"
}

main "$@"
```

### UV Python Template

```python
# /// script
# dependencies = [
#   "loguru",
#   "python-dotenv",
# ]
# ///
# Description: 
# Usage: 
# Author: yourusername
# Created: 2025-05-14

def main():
    """Main function."""
    print("Hello from uv script!")

if __name__ == "__main__":
    main()
```

## Using Scripts

### Listing Available Scripts

```bash
scripts
```

Example output:
```
Available Scripts:
-----------------
backup-config.sh  - Backs up system configuration files
compress-images.sh - Compresses images in current directory
git-stats.py      - Generates statistics for git repositories
```

### Running Scripts

Bash scripts:
```bash
compress-images.sh [arguments]
```

UV Python scripts:
```bash
uv run git-stats [arguments]
```

The `uv run` function:
1. Adds .py extension if needed
2. Runs with `uv run` to handle dependencies
3. Passes all arguments to the script

## Best Practices

### Script Naming
- Use hyphen-separated words
- Include descriptive prefixes (e.g., `backup-`, `git-`)
- Be concise but clear

### Script Documentation
Include in all script headers:
- Description: Short summary of what it does
- Usage: How to use, including arguments
- Author: Your name or username

### Categories
- **bash/**: Bash-specific functionality
- **uv/**: UV Python functionality
- **utils/**: General utility scripts
- **system/**: System administration
- **network/**: Network-related tools
- **dev/**: Development workflow scripts

### Node.js Package Management
For Node.js projects:
- Use `pnpm` instead of npm or yarn
- Note that "framer-motion" is now "motion"
- Update imports: `from 'motion/react'` instead of `from 'framer-motion'`

## Advanced Usage

### Adding New Categories

```bash
# Create directory
mkdir -p ~/Developer/scripts/new-category

# Reload shell
exec zsh
```

### Version Control

```bash
# Initialize repo
cd ~/Developer/scripts
git init

# Add gitignore
echo ".DS_Store" > .gitignore

# Initial commit
git add .
git commit -m "Initial setup"
```

## Troubleshooting

### ZSH Configuration Issues

If the system isn't working:

1. Check if zsh-config.zsh is sourced:
   ```bash
   grep "source.*zsh-config.zsh" ~/.zshrc
   ```

2. Verify paths in zsh-config.zsh:
   ```bash
   cat ~/Developer/scripts/zsh-config.zsh | grep "HOME/Developer/scripts"
   ```

3. Check if scripts directory is in PATH:
   ```bash
   echo $PATH | grep -o "Developer/scripts"
   ```

### Script Not Found

If a script isn't found:
1. Make it executable: `chmod +x ~/Developer/scripts/category/script-name.sh`
2. Check PATH: `echo $PATH | grep -o "~/Developer/scripts/category"`
3. Reload shell: `exec zsh`

### UV Script Issues

If dependencies aren't working:
1. Check PEP 723 format in script
2. Use `uv run` function, not direct execution
3. Verify UV installation: `uv --version`
