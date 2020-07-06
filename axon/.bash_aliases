# aliases
alias muxi='tmux attach-session -t'
alias coda="source activate"
alias codi="source deactivate"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias srgpu="srun --pty -t 0-04:00:00 --gres=gpu:1 -A ctn /bin/bash"
alias srgpu3h="srun --pty -t 0-08:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash"

alias sr1gpu1d="srun --pty -t 1-00:00:00 --gres=gpu:1 --mem-per-cpu=16G -A ctn /bin/bash"
alias sr3gpu1d="srun --pty -t 1-00:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash"


alias ekblion="ekellbuch@lion.paninski.zi.columbia.edu"

alias jobb="squeue | grep ekb2154"
# Functions
cd_up () {
    cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'


# File transfer
# send to lion from any directory
sendlion() {
    rsync -avh -e ssh "$1" ekellbuch@lion.paninski.zi.columbia.edu:"$2"
}

# get from lion from any directory add --progress if desired
getlion() {
    rsync -avh -e ssh ekellbuch@lion.paninski.zi.columbia.edu:"$1" .
}


alias c='clear ; ls'


# DGP Project temp alias
sendliondgp() {
    rsync -avh -e ssh "$1" ekellbuch@lion.paninski.zi.columbia.edu:/data/libraries/deepgraphpose/"$2"
}

# get from lion from any directory add --progress if desired
getliondgp() {
    rsync -avh -e ssh ekellbuch@lion.paninski.zi.columbia.edu:/data/libraries/deepgraphpose/"$1" .
}

# https://confluence.columbia.edu/confluence/display/zmbbi/Jupyter+Notebooks
jupyinit1() {
    #srun --pty -t 0-04:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash;
    ml anaconda3-2019.03;
    source activate "$1";
    XDG_RUNTIME_DIR="";
    jupyter lab --no-browser --ip=$(hostname -I | awk '{print $1}') --port=$(shuf -i 8888-9000 -n1);
}

dinit() {
    #srun --pty -t 0-04:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash;
    ml anaconda3-2019.03;
    source activate "$1";
    XDG_RUNTIME_DIR="";
}


alias jupyinit="jupyter lab --no-browser --ip=$(hostname -I | awk '{print $1}') --port=$(shuf -i 8888-9000 -n1)"

alias realias="source ~/.bash_aliases"



jupytopy()
{
    jupyter nbconvert --to script "$1"
}

jupytohtml()
{
    jupyter nbconvert "$1"
    filename=$1
    filename_base=${filename%.*}
    echo "${filename_base}.html"
}


