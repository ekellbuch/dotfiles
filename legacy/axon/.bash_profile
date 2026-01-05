# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export DLClight=True

module load cuda@10.0.130
module load cudnn@7.6.1.34-10.1
module load anaconda3-2019.03

#aliases
#alias rm="trash"
#alias jupyout="jupyter lab --port=8891 --NotebookApp.iopub_data_rate_limit=1.0e10 --no-browser"

