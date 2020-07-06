# aliases
alias realias="source ~/.bash_aliases"
alias muxi='tmux attach-session -t'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -lGH'
alias ll="ls -Flas"
alias c='clear ; ls'
alias coda="source activate"
alias codi="source deactivate"

# Functions
cd_up () {
    cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'

ddr()
{
    readlink -f "$1" | xclip -selection clipboard
}


# File transfer
sendlion() {
    rsync -avh -e ssh "$1" ekellbuch@lion.paninski.zi.columbia.edu:"$2"
}


# DGP Project temp alias
sendliondgp() {
    rsync -avh -e ssh "$1" ekellbuch@lion.paninski.zi.columbia.edu:/data/libraries/deepgraphpose/"$2"
}

# get from lion from any directory add --progress if desired
getlion() {
    rsync -avh -e ssh ekellbuch@lion.paninski.zi.columbia.edu:"$1" .
}

getliondgp() {
    rsync -avh -e ssh ekellbuch@lion.paninski.zi.columbia.edu:/data/libraries/deepgraphpose/"$1" .
}



# jupyter
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

dinit() {
    #srun --pty -t 0-04:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash;
    ml anaconda3-2019.03;
    source activate "$1";
    XDG_RUNTIME_DIR="";
}


# specific
alias srgpu="srun --pty -t 0-04:00:00 --gres=gpu:1 -A ctn /bin/bash"
alias srgpu3h="srun --pty -t 0-08:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash"

alias sr1gpu1d="srun --pty -t 1-00:00:00 --gres=gpu:1 --mem-per-cpu=16G -A ctn /bin/bash"
alias sr3gpu1d="srun --pty -t 1-00:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash"

alias ekblion="ekellbuch@lion.paninski.zi.columbia.edu"
alias jobb="squeue | grep ekb2154"


alias jupyinit="jupyter lab --no-browser --ip=$(hostname -I | awk '{print $1}') --port=$(shuf -i 8888-9000 -n1)"

# https://confluence.columbia.edu/confluence/display/zmbbi/Jupyter+Notebooks
jupyinit1() {
    #srun --pty -t 0-04:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash;
    ml anaconda3-2019.03;
    source activate "$1";
    XDG_RUNTIME_DIR="";
    jupyter lab --no-browser --ip=$(hostname -I | awk '{print $1}') --port=$(shuf -i 8888-9000 -n1);
}

