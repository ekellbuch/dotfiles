# aliases
alias realias='source ~/.bash_aliases'
alias muxi='tmux attach-session -t'
alias la='ls -A'
alias l='ls -CF'
#alias ls='ls -lGH'
alias ll="ls -Flas"
alias c='clear ; ls'
alias coda="conda activate"
alias codi="conda deactivate"
alias texi='latexmk -c; latexmk -pdf -pvc'
#alias rm="mv ~/.Trash"
#alias py='python'

# Functions
cd_up()
{
    cd $(printf "%0.s../" $(seq 1 $1));
}
alias 'cd..'='cd_up'

ddr() {
    readlink -f "$1" | xclip -selection clipboard
}
#rsync -avh -e ssh --progress ekb2154@axon.rc.zi.columbia.edu:$(tmpaxon) . ;

#copaxonfname () (
#    alias tmpaxon='ssh ekb2154@axon.rc.zi.columbia.edu "cat ~/.tmpfullpath"' ;
#)

alias tmpaxon='ssh ekb2154@axon.rc.zi.columbia.edu "cat ~/.tmpfullpath"' ;
copaxon() {
    tmpaxon1=$(ssh ekb2154@axon.rc.zi.columbia.edu "cat ~/.tmpfullpath") ;
    rsync -avhP -e ssh --progress ekb2154@axon.rc.zi.columbia.edu:${tmpaxon1} . ;
}

coplion() {
    tmplion1=$(ssh ekellbuch@lion.paninski.zi.columbia.edu "cat ~/.tmpfullpath") ;
    rsync -avhP -e ssh --progress ekellbuch@lion.paninski.zi.columbia.edu:${tmplion1} . ;
}


alias jupyinit='jupyter lab --port=8888 --NotebookApp.iopub_data_rate_limit=1.0e10'

# copy a file from a local server to a remove server with ssh
sendlion() {
  rsync -avh -e ssh --progress "$1" ekellbuch@lion.paninski.zi.columbia.edu:"$2"
}

# copy file from a remote server to a local server with ssh
getlion() {
  rsync -avh -e ssh --progress ekellbuch@lion.paninski.zi.columbia.edu:"$1" .
}

# copy a file from a local server to a remove server with ssh
sendaxon() {
  rsync -avh -e ssh --progress "$1" ekb2154@axon.rc.zi.columbia.edu:"$2"
}

# copy file from a remote server to a local server with ssh
getaxon() {
  rsync -avh -e ssh --progress ekb2154@axon.rc.zi.columbia.edu:"$1" .
}
#
# copy a file from a local server to a remove server with ssh
sendmoto() {
  rsync -avh -e ssh --progress "$1" ekb2154@terremoto.rcs.columbia.edu:"$2"
}

# copy file from a remote server to a local server with ssh
getmoto() {
  rsync -avh -e ssh --progress ekb2154@terremoto.rcs.columbia.edu:"$1" .
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

jupyview()
{
    jupyter nbconvert "$1"
    filename=$1
    filename_base=${filename%.*}
    xdg-open "${filename_base}.html"
    #gnome-terminal -e "${filename_base}.html"
}


# specific
alias logpanda='ssh -CYX ekellbuch@panda.stats.columbia.edu -p 22'
alias logkoala='ssh -CYX ekellbuch@koala.paninski.zi.columbia.edu -p 22'
alias loglion='ssh -CYX ekellbuch@lion.paninski.zi.columbia.edu -p 22'
alias loghaba='ssh -CYX ekb2154@habanero.rcs.columbia.edu -p 22'
alias logaxon='ssh -CYX ekb2154@axon.rc.zi.columbia.edu -p 22'
#alias logcunix='ssh -CYXv ekb2154@cunix.cc.columbia.edu'
alias logmoto='ssh -CYX ekb2154@terremoto.rcs.columbia.edu -p 22'

alias jupyinpanda='ssh -o ForwardX11=Yes -N -f -L localhost:8891:localhost:8891 ekellbuch@panda.stats.columbia.edu -p 22'
alias jupyinlion='ssh -o ForwardX11=Yes -N -f -L localhost:8891:localhost:8891 ekellbuch@lion.paninski.zi.columbia.edu -p 22'


#alias ekblion='ekellbuch@lion.paninski.zi.columbia.edu'
#alias ekbkoala='ekellbuch@koala.paninski.zi.columbia.edu'
#alias ekbmoto='ekb2154@terremoto.rcs.columbia.edu'
#alias ekbpanda='ekellbuch@panda.stats.columbia.edu'
#alias ekbhaba='ekb2154@habanero.rcs.columbia.edu'
#alias ekbaxon='ekb2154@axon.rc.zi.columbia.edu'

# alias vim='vim --servername vim'
#alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim'
#engridir='/run/user/1000/gvfs/smb-share:server=locker-smb.engram.rc.zi.columbia.edu,share=paninski-locker,user=ADCU%5Cekb2154'
engridir='/Volumes/paninski-locker'

