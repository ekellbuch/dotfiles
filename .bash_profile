# Exports
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/opt:${PATH}"
export PATH="$HOME/opt/python/libexec/bin:${PATH}"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:$PATH
export BLAS=/usr/local/lib/libopenblas.a
export LAPACK=/usr/local/lib/libopenblas.a
export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:$LD_LIBRARY_PATH

###############################################
# Virtualenvwrapper stuff
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
else
  echo "WARNING: Can't find virtualenvwrapper.sh"
fi

###################################################
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

#. ~/.profile
#case  $- in *i*) . ~/.bashrc;; esac


# Intel MKL & ICC
export MKL_NUM_THREADS=1
export MKL_DYNAMIC="FALSE"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
source /opt/intel/mkl/bin/mklvars.sh intel64
export MKLPATH="$MKLROOT/lib"
export MKLINCLUDE="$MKLROOT/include"
export LD_PRELOAD="/opt/intel/mkl/lib/libmkl_sequential.a"


export DYLD_LIBRARY_PATH="$MKLROOT/../compiler/lib:$MKLROOT/lib:$DYLD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/opt/intel/lib/intel64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/opt/intel/mkl/lib/intel64:$LD_LIBRARY_PATH"


########### Configuration
export CLICOLOR=1
export LSCOLORS="EHfxcxdxBxegecabagacad"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
##################

########### MY ALIASES ##################
alias logpanda='ssh -CY -x -Y -v ekellbuch@panda.stats.columbia.edu -p 22'
alias moshpanda='mosh --ssh="ssh -YCv" ekellbuch@panda.stats.columbia.edu'
alias logikcloud='ssh -p 60048 ekellbuch@lan-cloud.science'
alias ls='ls -lGH'
alias ll="ls -Flas"
alias loghaba='ssh ekb2154@habanero.rcs.columbia.edu'
alias jupyin='ssh -o ForwardX11=Yes -N -f -L localhost:8891:localhost:8891 ekellbuch@panda.stats.columbia.edu'
alias jupyinit='jupyter lab --port=8888 --NotebookApp.iopub_data_rate_limit=1.0e10'
alias muxi='tmux attach-session -t'
alias mytex='latexmk -c; latexmk -pdf'

alias vim='vim --servername vim'
#######################################

# Other Libraries
export TREFIDE="${HOME}/Projects/matrixfactorization/trefide"
export COCAIM="${HOME}/Projects/matrixfactorization/cocaim"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$COCAIM/src"

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$TREFIDE/src"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$TREFIDE/src/proxtv:$TREFIDE/src/glmgen/lib"

export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH}:$TREFIDE/src"
export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH}:$TREFIDE/src/proxtv:$TREFIDE/src/glmgen/lib"

export PYTHONPATH="${PYTHONPATH}:${COCAIM}"
