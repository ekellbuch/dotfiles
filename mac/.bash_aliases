########### MY ALIASES ##################
alias ekblion='ekellbuch@lion.paninski.zi.columbia.edu'
alias ekbkoala='ekellbuch@koala.paninski.zi.columbia.edu'
alias ekbmoto='ekb2154@terremoto.rcs.columbia.edu'
alias ekbpanda='ekellbuch@panda.stats.columbia.edu'
alias ekbhaba='ekb2154@habanero.rcs.columbia.edu'
alias ekbaxon='ekb2154@axon.rc.zi.columbia.edu'

alias portnumber=' -p 22'
alias logpanda='ssh -CYXv ekellbuch@panda.stats.columbia.edu -p 22'
alias logkoala='ssh -CYXv ekellbuch@koala.paninski.zi.columbia.edu -p 22'
alias loglion='ssh -CYv ekellbuch@lion.paninski.zi.columbia.edu -p 22'
alias loghaba='ssh -CYXv ekb2154@habanero.rcs.columbia.edu -p 22'
alias logaxon='ssh -CYXv ekb2154@axon.rc.zi.columbia.edu -p 22'
#alias logcunix='ssh -CYXv ekb2154@cunix.cc.columbia.edu'
alias logmoto='ssh -CYXv ekb2154@terremoto.rcs.columbia.edu -p 22'
alias jupyinpanda='ssh -o ForwardX11=Yes -N -f -L localhost:8891:localhost:8891 ekellbuch@panda.stats.columbia.edu -p 22'
alias jupyinlion='ssh -o ForwardX11=Yes -N -f -L localhost:8891:localhost:8891 ekellbuch@lion.paninski.zi.columbia.edu -p 22'

### Shortcuts
alias ls='ls -lGH'
alias ll="ls -Flas"
alias jupyinit='jupyter lab --port=8888 --NotebookApp.iopub_data_rate_limit=1.0e10'
alias muxi='tmux attach-session -t'
alias texi='latexmk -c; latexmk -pdf -pvc'
alias coda='conda activate'
alias codi='conda deactivate'
# alias vim='vim --servername vim'
#alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim'

# copy a file from a local server to a remove server with ssh
sendlion() {
  rsync -avhP -e ssh --progress "$1" ekellbuch@lion.paninski.zi.columbia.edu:"$2"
}

# copy file from a remote server to a local server with ssh
getlion() {
  rsync -avhP -e ssh --progress ekellbuch@lion.paninski.zi.columbia.edu:"$1" .
}

# copy a file from a local server to a remove server with ssh
sendaxon() {
  rsync -avhP -e ssh --progress "$1" ekb2154@axon.rc.zi.columbia.edu:"$2"
}

# copy file from a remote server to a local server with ssh
getaxon() {
  rsync -avhP -e ssh --progress ekb2154@axon.rc.zi.columbia.edu:"$1" .
}
#
# copy a file from a local server to a remove server with ssh
sendmoto() {
  rsync -avhP -e ssh --progress "$1" ekb2154@terremoto.rcs.columbia.edu:"$2"
}

# copy file from a remote server to a local server with ssh
getmoto() {
  rsync -avhP -e ssh --progress ekb2154@terremoto.rcs.columbia.edu:"$1" .
}
#
cd_up()
{
    cd $(printf "%0.s../" $(seq 1 $1));
}

alias 'cd..'='cd_up'
alias realias='source ~/.bash_aliases'
