#.bashrc
if ! [[ -z $PS1 ]]; then
    bind Space:magic-space
    bind '"\e[A"':history-search-backward
    bind '"\e[B"':history-search-forward
    export PS1="\t\[\033[01;30m\]|\[\033[01;34m\]\u\[\033[01;32m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\n\$ "
fi

# Autoload ssh-agent
if ! ps aux | grep ssh-agent | grep `whoami` | grep -v grep > /dev/null; then
    eval $(ssh-agent)
    ssh-add 2> /dev/null
fi

if [[ -f `brew --prefix`/etc/bash_completion ]]; then
    . `brew --prefix`/etc/bash_completion
fi

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
    if ![ -z $PS1 ]; then
        source "$HOME/.rvm/contrib/ps1_functions"
        ps1_set
    fi
fi

if [[ -f $HOME/.general_exports ]]; then
    . $HOME/.general_exports
fi


if ! [[ -z $PS1 ]]; then
    alias ls='ls -GFhb'
    shopt -s checkwinsize # Check window after each command
    shopt -s cdspell      # This will correct minor spelling errors in a cd cmd
    shopt -s histappend   # Append to history rather than overwrite
    shopt -s histreedit   # Edit failled substitutions
fi

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
