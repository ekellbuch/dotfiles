## dotfiles

Personal dotfiles and setup scripts for macOS. Configuration files live in `mac/` and get symlinked to `$HOME` by the deploy script.

### macOS setup

- **Clone the repo**

```bash
git clone git@github.com:ekellbuch/dotfiles.git
chmod +x deploy_osx.sh   # only needed once
```

- **Run the macOS deploy script**

```bash
./deploy_osx.sh          # Full deploy: create symlinks for all dotfiles
./deploy_osx.sh --diff   # Sync only uncommitted changes (rsync, no symlinks)
```

This will create the standard directory layout under your home directory (Neovim/Vim config, `~/scripts`, `~/.ctags.d`, `~/.claude/*`, `~/.cursor`, etc.) so you can safely link configs and add tooling.

### Architecture

- `mac/` - Active macOS dotfiles (`.bash_profile`, `.bashrc`, `.bash_aliases`, `.vimrc`, `.tmux.conf`, etc.)
- `legacy/` - Old configs from other machines (axon, lion, moto) - reference only
- `old/` - Deprecated configs - reference only
- `.claude/` - Claude Code settings and agents (symlinked to `~/.claude`)
- `deploy_common.sh` - Shared helpers (`mln`, `mln_if_exists`) for safe symlinking
- `deploy_osx.sh` - macOS deploy script; creates dirs and symlinks dotfiles

The deploy script uses `mln` (managed link) which:
- Creates parent directories as needed
- Skips if symlink already points to correct target
- Warns and skips if destination exists as regular file or different symlink

### Secrets (optional)

- **Create a `~/.secrets` file** (not checked into git) and export any private environment variables you need (API keys, tokens, dataset paths, etc.).
- `~/.bash_profile` is set up to source `~/.secrets` automatically if it exists.
