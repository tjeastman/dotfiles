# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh/contrib/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=""

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    git
    debian
    screen
    python
    autojump
    docker
    sudo
    dircycle
    pip
    ssh-agent
    colorize
    golang
    kubectl
    pyenv
    terraform
    minikube
    direnv
    lein
    pipenv)

# Customize to your needs...
HISTFILE=$HOME/.zsh_history

if [ -f $HOME/.zsh_personal ]; then
    source $HOME/.zsh_personal
fi

# set up user-specific path
if [ -d $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi
if [ -d $HOME/.local/bin ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

export WORKON_HOME=$HOME/.local/share/virtualenvs

source $ZSH/oh-my-zsh.sh
if [ -e $HOME/.zsh-theme ]; then
    source $HOME/.zsh-theme
else
    source $HOME/.zsh/custom.zsh-theme
fi

pyenv virtualenvwrapper_lazy

# set up zsh autosuggestions
source $HOME/.zsh/contrib/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=2'

# add zsh-completions to $fpath
fpath=($HOME/.zsh/contrib/zsh-completions/src $fpath)

# The Fuck corrects errors in previous console commands
if [[ $commands[thefuck] ]]; then
    eval $(thefuck --alias)
fi

# set path to host alias file
export HOSTALIASES=~/.hosts

# When set, Docker hides "legacy" top-level commands (such as docker
# rm, and docker pull) in docker help output, and only Management
# commands per object-type (e.g., docker container) are printed. This
# may become the default in a future release, at which point this
# environment-variable is removed.
export DOCKER_HIDE_LEGACY_COMMANDS=1
