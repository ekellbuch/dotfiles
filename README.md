## dotfiles

Personal dotfiles and setup scripts.

### macOS setup

- **Clone the repo**

```bash
git clone git@github.com:YOUR_USERNAME/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
chmod +x deploy_osx.sh   # only needed once
```

- **Run the macOS deploy script**

```bash
./deploy_osx.sh
```

This will create the standard directory layout under your home directory (Neovim/Vim config, `~/scripts`, `~/.ctags.d`, `~/.claude/*`, `~/.cursor`, etc.) so you can safely link configs and add tooling.

### Secrets (optional)

- **Create a `~/.secrets` file** (not checked into git) and export any private environment variables you need (API keys, tokens, dataset paths, etc.).
- `~/.bash_profile` is set up to source `~/.secrets` automatically if it exists.
