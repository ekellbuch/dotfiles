if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi


### Shortcuts
# Jupyter notebook variables
alias jupyout='jupyter lab --no-browser --port=8891 --NotebookApp.iopub_data_rate_limit=1.0e10'
alias jupydie='lsof -ti:8891 | xargs kill -9'

alias jupyout1='jupyter lab --no-browser --port=8892 --NotebookApp.iopub_data_rate_limit=1.0e10'
alias jupydie1='lsof -ti:8892 | xargs kill -9'

alias jupyinit='jupyter lab --port=8889 --NotebookApp.iopub_data_rate_limit=1.0e10'
alias muxi='tmux attach-session -t'
