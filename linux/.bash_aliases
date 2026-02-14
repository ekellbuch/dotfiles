########################################
# ~/.bash_aliases (Linux)
########################################

# Shared aliases and functions
[ -f ~/.bash_common ] && . ~/.bash_common

# ls with color
alias ls='ls --color=auto'

alias py="python"
alias soda="source activate"
alias sodi="source deactivate"

########################################
# Sherlock paths
########################################
export DOTFILES_DIR="/home/groups/swl1/ekb/Projects/dotfiles"
export SHERLOCK_PROJECTS="/home/groups/swl1/ekb/Projects"
export SHERLOCK_RUNNER_DIR="/home/groups/swl1/ekb/actions-runner"
export GROUP_BASE="/home/groups/swl1/ekb"

########################################
# Slurm
########################################
alias q='squeue'
alias qq='squeue -u ${LOGNAME}'
alias qqq='q-full -u ${LOGNAME}'
alias qqo='squeue -u ${LOGNAME} --sort=+i'
alias qqg='squeue -A swl1'
alias q-full='squeue -o "%20i %5t %45j %20S %10M %10L %5C %10b %5D %10m %20r %100N"'
alias qos='sacctmgr show qos'
alias gpualloc='salloc --gres=gpu:1 --cpus-per-task=8 --mem=64G --time=30-00:00:00'

########################################
# Tokens
########################################
load_tokens() {
  set +x
  if [ -r "$HOME/.secrets/tokens.sh" ]; then
        . "$HOME/.secrets/tokens.sh"
        echo "tokens loaded"
  else
        echo " $HOME/.secrets/tokens.sh not found or unreadable"
  fi
}

########################################
# Machine-specific overrides
########################################
[ -f ~/.bash_aliases.local ] && . ~/.bash_aliases.local
