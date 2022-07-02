#!/bin/zsh
##################################################################################
# Shellscript : .zshrc                              					 .--.    #
# Author      : Venkata Kolagotla <vkolagotla@pm.me>                    |ö_ö |   #
# Created     : 18-11-2020                                              |\ü/ |   #
# Last Updated: 03-07-2022                                         	   //   \ \  #
# Requires    : zsh, oh-my-zsh, conda, tmux, hadoop, fast, farge,     (|     | ) #
#               git-summany script, imagemagik, protonvpn, jrnl,     /'\_   _/`\\#
#               code, go, terminal.py script, qrencode               \___)=(___//#
# Category    : configuration file                                               #
# Version     : v0.4.6                                                           #
# License     : GNU GPLv3                                                        #
##################################################################################
# Description : zsh configuration
#               custom aliases and functions
#               python(conda) configuration
#               hadoop configuration
#               tmux configuration
# Usage       : replace the file at home dir(~/) or use it as a reference
##################################################################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# set tmux as the default shell
case $- in *i*)
    [ -z "$TMUX" ] && exec tmux
esac

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# good themes
# amuse
# mortalscumbag
# humza
# spaceship
ZSH_THEME="mortalscumbag"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Export default user to terminal
prompt_context() {}

# change dir colors
# export CLICOLOR=1
LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# # COMPLETION SETTINGS
# # add custom completion scripts
# fpath=(~/.zsh/completion $fpath) 
 
# # compsys initialization
# autoload -U compinit
# compinit
 
# # show completion menu when number of options is at least 2
# zstyle ':completion:*' menu select=2

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    zsh-autosuggestions
    zsh-completions
    git
    sudo
    command-not-found
    zsh-syntax-highlighting
    history-substring-search
    per-directory-history
    safe-paste
    z
    themes
    you-should-use
    zsh-random-quotes
    zsh-riddle-me
    )

source $ZSH/oh-my-zsh.sh

# keybinds for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# My custom aliases in a separate file
. ~/.zsh_aliases

# share history between shells
setopt share_history

# ignore jrnl command adding to history
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"

# custom bash functions
. ~/.zsh_functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# auto conda env activation
# source auto_conda

# enable conda to be called from scripts
# export -f conda
# export -f __conda_activate
# export -f __conda_reactivate
# export -f __conda_hashr

# activate zsh in shell script
# source ~/anaconda3/bin/activate root  # commented out by conda initialize

# activate pytest in conda
export PATH="$HOME/anaconda3/bin/pytest:$PATH"

# for own bash scripts to run with sudo
export PATH=$PATH:~/bin

# Hadoop setup for pseudo mode
export HADOOP_HOME=/usr/local/hadoop 
export HADOOP_MAPRED_HOME=$HADOOP_HOME 
export HADOOP_COMMON_HOME=$HADOOP_HOME 
export HADOOP_HDFS_HOME=$HADOOP_HOME 
export YARN_HOME=$HADOOP_HOME 
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native 
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin 
export HADOOP_INSTALL=$HADOOP_HOME
### End of hadoop setup

export GOPATH="$HOME/go_workspace"
