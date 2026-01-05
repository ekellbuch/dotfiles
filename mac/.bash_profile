# ----- Prompt -----
PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] $ "

# ----- Path -----
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.docker/bin:$PATH"
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH="/Library/TeX/texbin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"


# ----- Environment -----
export TMPDIR="/tmp"

# ----- Conda -----
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
else
    export PATH="$HOME/miniconda3/bin:$PATH"
fi

# ----- Google Cloud SDK -----
[ -f "$HOME/Downloads/google-cloud-sdk/path.bash.inc" ] && . "$HOME/Downloads/google-cloud-sdk/path.bash.inc"
[ -f "$HOME/Downloads/google-cloud-sdk/completion.bash.inc" ] && . "$HOME/Downloads/google-cloud-sdk/completion.bash.inc"

# ----- Source additional configs -----
[ -f ~/.bashrc ] && . ~/.bashrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.secrets ] && . ~/.secrets