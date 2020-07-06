# aliases
alias realias='source ~/.bash_aliases'
alias muxi='tmux attach-session -t'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -lGH'
alias ll="ls -Flas"
alias c='clear ; ls'
alias coda="conda activate"
alias codi="conda deactivate"

# Functions
cd_up()
{
    cd $(printf "%0.s../" $(seq 1 $1));
}
alias 'cd..'='cd_up'

ddr()
{
    readlink -f "$1" | xclip -selection clipboard
}

# Sync to and from axon server add --progress if desired
sendlion() { rsync -avh -e ssh "$1" ekellbuch@lion.paninski.zi.columbia.edu:"$2" }
sendaxon()
{ rsync -avhP -e ssh "$1" ekb2154@axon.rc.zi.columbia.edu:"$2" }
sendmoto()
{
    rsync -avh -e ssh "$1" ekb2154@terremoto.rcs.columbia.edu:"$2"
}

# get from lion from any directory add --progress if desired
getlion() { rsync -avh -e ssh ekellbuch@lion.paninski.zi.columbia.edu:"$1" . }
getaxon() { rsync -avh -e ssh  ekb2154@axon.rc.zi.columbia.edu:"$1" . }
getmoto() { rsync -avh -e ssh ekb2154@terremoto.rcs.columbia.edu:"$1" . }

sendmac() { rsync -avh -e ssh "$1" kelly@160.39.4.175:/Users/kelly/Downloads }

sendaxondgp() { rsync -avhP -e ssh "$1" ekb2154@axon.rc.zi.columbia.edu:/home/ekb2154/data/libraries/deepgraphpose/"$2" }


#jupyter
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

jupyview()
{
    jupyter nbconvert "$1"
    filename=$1
    filename_base=${filename%.*}
    xdg-open "${filename_base}.html"
    #gnome-terminal -e "${filename_base}.html"
}

# specific
alias o="xdg-open"
alias rm="trash"
dgpsrc=/data/libraries/deepgraphpose/src/deepgraphpose/graphpose
dgpmain=/data/libraries/deepgraphpose
engridir='/run/user/1000/gvfs/smb-share:server=locker-smb.engram.rc.zi.columbia.edu,share=paninski-locker,user=ADCU%5Cekb2154'

alias jupyinit="jupyter lab --port=8888 --NotebookApp.iopub_data_rate_limit=1.0e10"
alias jupyout="jupyter lab --port=8891 --NotebookApp.iopub_data_rate_limit=1.0e10 --no-browser"
alias logpanda='ssh -CY -x -Y -v ekellbuch@panda.stats.columbia.edu -p 22'
alias logaxon='ssh -CY -x -Y -v ekb2154@axon.rc.zi.columbia.edu -p 22'
alias loghaba='ssh -CY -x -Y -v ekb2154@habanero.rcs.columbia.edu -p 22'
alias logmoto='ssh -CY -x -Y -v ekb2154@terremoto.rcs.columbia.edu -p 22'


#shopt -s expand_aliases
#shopt -s cdable_vars
#shopt -s direxpand
# engram

