# Git Scripts

A collection of useful Git scripts and configurations to enhance your Git workflow. This repository provides a set of tools and configurations that make Git operations more efficient and user-friendly.

## Features

### Git Scripts

1. **git-smart-fetch.sh** (`git sf`)
   - Smart fetch that automatically handles ref lock issues
   - Automatically prunes stale remote-tracking branches
   - Provides clear error messages and automatic recovery

2. **git-clean-branches.sh** (`git clean-branches`)
   - Cleans up merged and stale branches
   - Safely removes branches that have been merged into main/master
   - Removes branches whose remote tracking branches are gone
   - Interactive confirmation before deletion

3. **better-branch-output.sh** (`git bb`)
   - Enhanced branch listing with better formatting
   - Shows more detailed branch information
   - Improved readability of branch status

### Git Configuration

The repository includes a comprehensive Git configuration template that sets up:
- Sensible defaults for common Git operations
- Useful aliases for frequent commands
- Optimized settings for performance and usability
- GPG signing configuration
- Branch management settings
- Color and UI improvements

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/karthik-js/git-scripts.git
   cd git-scripts
   ```

2. Run the setup script:
   ```bash
   ./setup.sh
   ```

The setup script will:
- Copy all scripts to `~/.git-scripts`
- Set up the Git configuration
- Configure global Git aliases

## Usage

After installation, you can use the following commands:

- `git sf` - Smart fetch with automatic issue resolution
- `git clean-branches` - Clean up merged and stale branches
- `git bb` - Enhanced branch listing

### Additional Git Aliases

The configuration includes several useful aliases:
- `git s` - Short and clean status with branch info
- `git lg` - Pretty log with graph visualization
- `git amend` - Amend last commit without changing message
- `git undo` - Undo last commit but keep changes staged
- `git root` - Print repository root directory
- `git stash-pop-safe` - Safer alternative to stash pop

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is open source and available under the MIT License.

## Author

Created by [Karthik JS](https://github.com/karthik-js)