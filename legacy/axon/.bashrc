# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Load modules
#module load cuda@10.0.130
#module load cudnn@7.6.1.34-10.1
#module load anaconda3-2019.03

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/share/apps/anaconda3-2019.03/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/share/apps/anaconda3-2019.03/etc/profile.d/conda.sh" ]; then
#        . "/share/apps/anaconda3-2019.03/etc/profile.d/conda.sh"
#    else
#        export PATH="/share/apps/anaconda3-2019.03/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

#export PS1='\[\e[3\2mu\] \[\e[36m\w\] \[\e[33m\]\[\e[1m\]$ \[\e[0m\]'

#export PS1='\[\033[02;32m\]\u@\H:\[\033[02;34m\]\w\$\[\033[00m\] '


#LS_COLOR=S'di=1;31'
PROMPT_DIRTRIM=3
export PS1="\[\033[38;5;212m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


