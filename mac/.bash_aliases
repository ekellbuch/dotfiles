########################################
# ~/.bash_aliases
########################################

########################################
# Basics
########################################
realias() { source ~/.bash_aliases; }


# ls family
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -Flas'
alias c='clear; ls'

# tmux
alias muxi='tmux attach-session -t'

########################################
# Conda
########################################
coda() { conda activate "$@"; }
codi() { conda deactivate; }

########################################
# TeX
########################################
texi() { latexmk -c; latexmk -pdf -pvc; }
#alias rm="mv ~/.Trash"
#alias py='python'

########################################
# Utility: platform detection
########################################
_is_cmd() { command -v "$1" >/dev/null 2>&1; }


# "open file/URL" cross-platform
open_cmd() {
  if _is_cmd xdg-open; then xdg-open "$@"
  elif _is_cmd open; then open "$@"
  else echo "No opener found (xdg-open/open)."
  fi
}

# copy to clipboard cross-platform
clipcopy() {
  if _is_cmd pbcopy; then pbcopy
  elif _is_cmd xclip; then xclip -selection clipboard
  else echo "No clipboard tool found (pbcopy/xclip)." >&2; return 1
  fi
}

# "realpath" fallback (mac-safe)
abspath() {
  if _is_cmd realpath; then realpath "$1"
  else
    # python fallback
    python - <<'PY' "$1"
import os, sys
print(os.path.realpath(sys.argv[1]))
PY
  fi
}

# Copy absolute path to clipboard
ddr() {
  local p
  p="$(abspath "$1")" || return
  printf "%s" "$p" | clipcopy || return
  echo "Copied: $p"
}



########################################
# Navigation helpers
########################################
cd_up()
{
    cd $(printf "%0.s../" $(seq 1 $1));
}
alias 'cd..'='cd_up'

########################################
# Git helpers
########################################
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

gcm()  { git commit -m "$*"; }
gcmp() { git commit -m "$*" && git push; }

########################################
# Remote hosts (define once)
########################################
SSH_PORT=22
SSH_FLAGS=(-C -Y -X)

# Hosts
HOST_AXON="axon.rc.zi.columbia.edu"
HOST_HABA="habanero.rcs.columbia.edu"
HOST_MOTO="terremoto.rcs.columbia.edu"
HOST_LION="lion.paninski.zi.columbia.edu"
HOST_PANDA="panda.stats.columbia.edu"
HOST_KOALA="koala.paninski.zi.columbia.edu"
HOST_SHER="login.sherlock.stanford.edu"

# Usernames
USER_AXON="ekb2154"
USER_PAN="ekellbuch"
USER_SHER="ekb"

SHER_TRANSFER_DIR="/home/groups/swl1/ekb/transfer"


# Map "name" -> "user@host"
remote_spec() {
  case "$1" in
    lion)  echo "${USER_PAN}@${HOST_LION}" ;;
    panda) echo "${USER_PAN}@${HOST_PANDA}" ;;
    koala) echo "${USER_PAN}@${HOST_KOALA}" ;;
    axon)  echo "${USER_AXON}@${HOST_AXON}" ;;
    haba)  echo "${USER_AXON}@${HOST_HABA}" ;;
    moto)  echo "${USER_AXON}@${HOST_MOTO}" ;;
    sher)  echo "${USER_SHER}@${HOST_SHER}" ;;
    *)
      echo "Unknown remote: $1 (expected: lion|panda|koala|axon|haba|moto)" >&2
      return 1
      ;;
  esac
}

remote_default_dir() {
  case "$1" in
    sher) echo "$SHER_TRANSFER_DIR" ;;
    # lion) echo "/some/default/dir" ;;   # add later
    # axon) echo "/some/default/dir" ;;
    # panda) echo "/some/default/dir" ;;
    *)    return 1 ;;
  esac
}

########################################
# SSH / rsync generic commands
########################################

logremote() {
  # Usage: logremote lion
  local r; r="$(remote_spec "$1")" || return
  ssh -p "$SSH_PORT" -CYX "$r"
}

rsync_ssh() {
  rsync -avhP --progress -e "ssh -p $SSH_PORT" "$@"
}

sendremote() {
  # Usage: sendremote sher <local_path> <remote_path>
  local r; r="$(remote_spec "$1")" || return
  local src="$2"
  local dst="$3"

  local r; r="$(remote_spec "$remote")" || return

  [[ -n "$src" ]] || { echo "Usage: sendremote <remote> <local_path> [remote_path]" >&2; return 2; }

  if [[ -z "$dst" ]]; then
    local defdir
    defdir="$(remote_default_dir "$remote")" || {
      echo "No default directory configured for remote '$remote' (pass remote_path explicitly)" >&2
      return 2
    }
    dst="${defdir%/}/$(basename "$src")"
  fi
  rsync_ssh "$src" "${r}:$dst"
}

getremote() {
  # Usage: getremote lion <remote_path> [local_dest=.]
  local r; r="$(remote_spec "$1")" || return
  local src="$2"
  local dst="${3:-.}"
  if [[ -z "$src" ]]; then
    echo "Usage: getremote <remote> <remote_path> [local_dest]" >&2
    return 2
  fi
  rsync_ssh "${r}:$src" "$dst"
}

tmpremote() {
  # Usage: tmpremote lion
  local r; r="$(remote_spec "$1")" || return
  ssh -p "$SSH_PORT" "$r" 'cat ~/.tmpfullpath'
}

copremote() {
  # Usage: copremote lion
  local r; r="$(remote_spec "$1")" || return
  local p
  p="$(ssh -p "$SSH_PORT" "$r" 'cat ~/.tmpfullpath')" || return
  p="${p%$'\n'}"
  [[ -n "$p" ]] || { echo "No ~/.tmpfullpath on $1" >&2; return 1; }
  rsync_ssh "${r}:$p" "."
}
########################################
# Jupyter
########################################
jupyinit() {
  local port="${1:-8888}"
  jupyter lab --port="$port" --NotebookApp.iopub_data_rate_limit=1.0e10
}

jupytopy()  { jupyter nbconvert --to script "$1"; }
jupytohtml() { jupyter nbconvert --to html "$1"; echo "${1%.*}.html"; }

jupyview() {
  jupyter nbconvert --to html "$1" || return
  open_cmd "${1%.*}.html"
}

########################################
# Jupyter port forwarding
########################################
jupytunnel() {
  # Usage: jupytunnel panda [local_port=8891] [remote_port=8891]
  local r; r="$(remote_spec "$1")" || return
  local lport="${2:-8891}" rport="${3:-8891}"
  echo "Forwarding http://localhost:${lport} -> ${1}:localhost:${rport}"
  ssh -p "$SSH_PORT" -o ForwardX11=Yes -N -f -L "localhost:${lport}:localhost:${rport}" "$r"
}

########################################
# Misc
########################################

# Data directories
export DATADIR="$HOME/data"
export WANDB_DIR="$DATADIR/wandb/logs"
export WANDB_CACHE_DIR="$DATADIR/wandb/cache"
export WANDB_CONFIG_DIR="$DATADIR/wandb/config"
export WANDB_DATA_DIR="$DATADIR/wandb/data"
export WANDB_ARTIFACT_DIR="$DATADIR/wandb/artifacts"

# Mac specific
export ENGRI_DIR='/Volumes/paninski-locker'

