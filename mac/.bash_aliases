########################################
# ~/.bash_aliases (macOS)
########################################

# Shared aliases and functions
[ -f ~/.bash_common ] && . ~/.bash_common

########################################
# TeX
########################################
texi() { latexmk -c; latexmk -pdf -pvc; }

########################################
# Slurm
########################################
alias gpualloc='salloc --gres=gpu:1 --cpus-per-task=8 --mem=64G --time=30-00:00:00'

########################################
# Data directories
########################################
export DATADIR="$HOME/data"
export WANDB_DIR="$DATADIR/wandb/logs"
export WANDB_CACHE_DIR="$DATADIR/wandb/cache"
export WANDB_CONFIG_DIR="$DATADIR/wandb/config"
export WANDB_DATA_DIR="$DATADIR/wandb/data"
export WANDB_ARTIFACT_DIR="$DATADIR/wandb/artifacts"

########################################
# Mac specific
########################################
export ENGRI_DIR='/Volumes/paninski-locker'

realias_tokens() { source ~/.secrets/tokens.sh; }
realias_tokens
