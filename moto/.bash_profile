# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export DLClight=True

# aliases
#module load gcc/4.8.5
#module load cuda10.1/toolkit
#module load cuda10.1/blas
#module load cudnn/cuda_10.1_v7.6.4
#module load cudnn
module load anaconda/3-2019.03


#alias muxi='tmux attach-session -t'
#alias coda="source activate"
#alias codi="source deactivate"
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'
#alias srgpu="srun --pty -t 0-00:30:00 --gres=gpu:1 -A stats /bin/bash"
#alias ekblion="ekellbuch@lion.paninski.zi.columbia.edu"

# Functions
#cd_up () {
#    cd $(printf "%0.s../" $(seq 1 $1 ));
#}
#alias 'cd..'='cd_up'


# File transfer
# send to lion from any directory
#sendlion() {
#    rsync -avzhe ssh --progress "$1" ekellbuch@lion.paninski.zi.columbia.edu:"$2"
#}

# get from lion from any directory
#getlion() {
#    rsync -avzhe ssh --progress ekellbuch@lion.paninski.zi.columbia.edu:"$1" .
#}

