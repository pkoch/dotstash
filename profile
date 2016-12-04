# Autoload ssh-agent
if ! ps aux | grep ssh-agent | grep `whoami` | grep -v grep > /dev/null; then
    eval $(ssh-agent)
    ssh-add 2> /dev/null
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [[ -f $HOME/.general_exports ]]; then
    . $HOME/.general_exports
fi

if ! [[ -z $PS1 ]]; then
    if [[ -f $HOME/.aliases ]]; then
        . $HOME/.aliases
    fi
    bind Space:magic-space
    bind '"\e[A"':history-search-backward
    bind '"\e[B"':history-search-forward
    shopt -s checkwinsize # Check window after each command
    shopt -s cdspell      # This will correct minor spelling errors in a cd cmd
    shopt -s histappend   # Append to history rather than overwrite
    shopt -s histreedit   # Edit failled substitutions
    source $HOME/.shell_prompt.sh
fi
