# aliases
alias realias="source ~/.bash_aliases"
alias la='ls -A  --color=auto'
alias l='ls -CF  --color=auto'
alias ll='ls -alFs --color=auto'
alias ls='ls -lGH --color=auto'
alias c='clear ; ls'


alias muxi='tmux attach-session -t'

alias py="python"
alias wpy="ls -ls  find *.py"

alias coda="source activate"
alias codi="source deactivate"

alias copout='readlink -f "$1" > ~/.tmpfullpath'

# Functions
cd_up () {
    cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'

# doesn't work on centos remote
#ddr () {
#    readlink -f "$1" | xclip -selection clipboard
#}

coplion() {
    tmpaxon1=$(ssh ekellbuch@lion.paninski.zi.columbia.edu "cat ~/.tmpfullpath") ;
    rsync -avhP -e ssh --progress ekellbuch4@lion.paninski.zi.columbia.edu:${tmpaxon1} . ;
}

copaxon() {
    tmpaxon1=$(ssh ekb154@axon.rc.zi.columbia.edu "cat ~/.tmpfullpath") ;
    rsync -avhP -e ssh --progress ekb2154@axon.rc.zi.columbia.edu:${tmpaxon1} . ;
}

# send to lion from any directory
sendlion() {
    rsync -avh -e ssh "$1" ekellbuch@lion.paninski.zi.columbia.edu:"$2"
}
sendaxon(){
    rsync -avhP -e ssh "$1" ekb2154@axon.rc.zi.columbia.edu:"$2"
}
sendmoto(){
    rsync -avh -e ssh "$1" ekb2154@terremoto.rcs.columbia.edu:"$2"
}

# get from lion from any directory add --progress if desired
getlion() {
    rsync -avh -e ssh ekellbuch@lion.paninski.zi.columbia.edu:"$1" .
}
getaxon() {
    rsync -avh -e ssh  ekb2154@axon.rc.zi.columbia.edu:"$1" .
}
getmoto() {
    rsync -avh -e ssh ekb2154@terremoto.rcs.columbia.edu:"$1" .
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

#%%
alias jobb="squeue | grep ekb2154"
# Axon
alias srgpu="srun --pty -t 0-04:00:00 --gres=gpu:1 -A ctn /bin/bash"
alias srgpu3h="srun --pty -t 0-08:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash"
alias sr1gpu1d="srun --pty -t 1-00:00:00 --gres=gpu:1 --mem-per-cpu=16G -A ctn /bin/bash"
alias sr3gpu1d="srun --pty -t 1-00:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash"
#alias ekblion="ekellbuch@lion.paninski.zi.columbia.edu"

# https://confluence.columbia.edu/confluence/display/zmbbi/Jupyter+Notebooks
alias jupyinit="jupyter lab --no-browser --ip=$(hostname -I | awk '{print $1}') --port=$(shuf -i 8888-9000 -n1)"
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

