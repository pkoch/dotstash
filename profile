if [[ -f $HOME/.general_exports ]]; then
    . $HOME/.general_exports
fi

if [[ "$(uname -a | awk '{print $1}')" == "Darwin" ]]; then
    # Autoload ssh-agent
    if ! ps aux | grep ssh-agent | grep `whoami` | grep -v grep > /dev/null; then
        eval $(ssh-agent)
        ssh-add 2> /dev/null
    fi

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

if which exenv >/dev/null ; then
    eval "$(exenv init -)"
fi

if which rbenv >/dev/null ; then
    eval "$(rbenv init -)"
fi

if which pyenv > /dev/null; then
    eval "$(pyenv init -)";
    if pyenv virtualenv-init 2>&1 | grep -v 'no such command' >/dev/null; then
        eval "$(pyenv virtualenv-init -)";
    fi
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

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
fi
