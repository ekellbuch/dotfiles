# Exports
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/opt:${PATH}"
export PATH="$HOME/opt/python/libexec/bin:${PATH}"
export PATH="/usr/local/opt/python/libexec/bin:${PATH}"
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:${PATH}
export BLAS=/usr/local/lib/libopenblas.a
export LAPACK=/usr/local/lib/libopenblas.a
export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:$LD_LIBRARY_PATH

###################################################
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

#. ~/.profile
#case  $- in *i*) . ~/.bashrc;; esac

test -f ~/.bash_aliases && source ~/.bash_aliases

# Intel MKL & ICC
export MKL_NUM_THREADS=1
export MKL_DYNAMIC="FALSE"
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
source /opt/intel/mkl/bin/mklvars.sh intel64
# source /opt/intel/parallel_studio_xe_2018.2.046/bin/psxevars.sh
export MKLPATH="$MKLROOT/lib"
export MKLINCLUDE="$MKLROOT/include"
export LD_PRELOAD="/opt/intel/mkl/lib/libmkl_sequential.a"

export LD_LIBRARY_PATH="/opt/intel/lib/intel64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/opt/intel/mkl/lib/intel64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$MKLROOT/../:$LD_LIBRARY_PATH"

########### Configuration
export PS1="\[\033[38;5;212m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS="EHfxcxdxBxegecabagacad"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
##################


# Other Libraries
export TREFIDE="${HOME}/Projects/matrixfactorization/trefide"
export COCAIM="${HOME}/Projects/matrixfactorization/cocaim"

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$COCAIM/src"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$TREFIDE/src"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$TREFIDE/src/proxtv:$TREFIDE/src/glmgen/lib"

export DYLD_LIBRARY_PATH="$MKLROOT/../compiler/lib:$MKLROOT/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH}:$TREFIDE/src"
export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH}:$TREFIDE/src/proxtv:$TREFIDE/src/glmgen/lib"

export PYTHONPATH="${PYTHONPATH}:${COCAIM}"

# added by Anaconda3 5.2.0 installer
#export PATH="/Users/kelly/anaconda3/bin:$PATH"  # commented out by conda initialize

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/kelly/google-cloud-sdk/path.bash.inc' ]; then source '/Users/kelly/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/kelly/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/kelly/google-cloud-sdk/completion.bash.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kelly/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kelly/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kelly/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kelly/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:${PATH}
#export PATH=/Applications/MacVim.app/Contents/MacOS/Vim:${PATH}


