#aliases
alias muxi='tmux attach-session -t'
alias coda="source activate"
alias codi="source deactivate"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias srgpu="srun --pty -t 0-02:00:00 --gres=gpu:1 -A stats /bin/bash"
alias srgpu3h="srun --pty -t 0-04:00:00 --gres=gpu:3  -A stats /bin/bash"
alias ekblion="ekellbuch@lion.paninski.zi.columbia.edu"

alias jobb="squeue | grep ekb2154"
# Functions
cd_up () {
    cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'


# File transfer
alias tmpaxon='ssh ekb2154@axon.rc.zi.columbia.edu "cat ~/.tmpfullpath"' ;
copaxon() {
    tmpaxon1=$(ssh ekb2154@axon.rc.zi.columbia.edu "cat ~/.tmpfullpath") ;
    rsync -avhP -e ssh --progress ekb2154@axon.rc.zi.columbia.edu:${tmpaxon1} . ;
}

coplion() {
    tmplion1=$(ssh ekellbuch@lion.paninski.zi.columbia.edu "cat ~/.tmpfullpath") ;
    rsync -avhP -e ssh --progress ekellbuch@lion.paninski.zi.columbia.edu:${tmplion1} . ;
}


# send to lion from any directory
sendlion() {
    rsync -avzhe ssh --info=progress2 "$1" ekellbuch@lion.paninski.zi.columbia.edu:"$2"
}

# get from lion from any directory
getlion() {
    rsync -avzhe ssh --info=progress2 ekellbuch@lion.paninski.zi.columbia.edu:"$1" .
}

# send to axon from any directory
sendaxon() {
    rsync -avzhe ssh --info=progress2 "$1" ekb2154@axon.rc.zi.columbia.edu:"$2"
}


getaxon() {
    rsync -avh -e ssh  ekb2154@axon.rc.zi.columbia.edu:"$1" . 
}

alias c='clear ; ls'
alias realias="source ~/.bash_aliases"

jupyinit1() {
    #srun --pty -t 0-04:00:00 --gres=gpu:3 --mem-per-cpu=16G -A ctn /bin/bash;
    unset XDG_RUNTIME_DIR;
    ml anaconda/3-2019.03;
    ml cuda10.1/toolkit
    ml cudnn/cuda_10.1_v7.6.4    
    source activate "$1";
    jupyter lab --no-browser --ip=$(hostname -I | awk '{print $1}') --port=$(shuf -i 8888-9000 -n1);
}
#
