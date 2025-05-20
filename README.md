# Git Scripts

A collection of Git scripts and configurations to enhance your Git workflow. These tools make Git operations more efficient and user-friendly.

## Scripts

1. **git-smart-fetch.sh** (`git sf`)

   - Smart fetch with automatic issue resolution
   - Auto-prunes stale remote-tracking branches
   - Clear error messages and recovery

2. **git-clean-branches.sh** (`git clean-branches`)

   - Removes merged and stale branches
   - Safe cleanup of branches merged into main/master
   - Interactive confirmation

3. **better-branch-output.sh** (`git bb`)

   - Enhanced branch listing
   - Detailed branch information
   - Better readability

4. **git-interactive-stage.sh** (`git is`)
   - Interactive file staging with fzf
   - Preview changes before staging
   - Multi-select support
   - Staged changes summary

## Quick Start

```bash
# Clone and setup
git clone https://github.com/karthik-js/git-scripts.git
cd git-scripts
./setup.sh
```

The setup script will:

- Copy all scripts to `~/.git-scripts`
- Set up the Git configuration
- Configure global Git aliases

## Available Commands

- `git sf` - Smart fetch
- `git clean-branches` - Clean up branches
- `git bb` - Better branch output
- `git is` - Interactive staging

## Git Aliases

### Status and Logging

- `git s` - Short status with branch info
- `git lg` - Pretty log (last 30 commits)
- `git todaylog` - Today's commits

### Commit Management

- `git amend` - Amend last commit
- `git undo` - Undo last commit
- `git stash-pop-safe` - Safe stash pop

### Repository Info

- `git root` - Show repo root

## Git Configuration

The setup includes optimized Git settings:

- Smart defaults for common operations
- Branch sorting by commit date
- Automatic remote tracking
- GPG signing with SSH
- Automatic maintenance
- Color-coded output

### Configuration Details

- Core settings optimized for modern development
- Automatic CRLF handling
- Column-based UI for better readability
- Branch sorting by most recent commits
- Tag sorting by version
- Default branch set to main
- Simple push strategy with auto remote setup
- Automatic tag following
- Prune on fetch for clean repository
- Help autocorrect with prompts
- Verbose commits with GPG signing
- Rerere enabled for conflict resolution
- Rebase with reference updates
- SSH-based GPG signing
- Automatic maintenance with incremental strategy
- Optimized garbage collection
- Color-coded UI

## Dependencies

- [fzf](https://github.com/junegunn/fzf) - Required for `git is`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

MIT License - See [LICENSE](LICENSE) file

## Author

[Karthik JS](https://github.com/karthik-js)
