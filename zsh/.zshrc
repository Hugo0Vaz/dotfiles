export ZSH="$HOME/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts/layouts/"

export PATH="$PATH:/usr/local"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.pyenv/bin/"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$HOME/.tmuxifier/bin/:$PATH"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

autoload -Uz compinit && compinit

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
    user
    host
    dir
    git
    venv
    exec_time
    line_sep
    exit_code
    char
)

SPACESHIP_USER_SHOW=always
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_EXIT_CODE_SYMBOL='✘'
SPACESHIP_CHAR_SUFFIX=' '

plugins=(git)

source $ZSH/oh-my-zsh.sh

if command -v pyenv &> /dev/null
then
    eval "$(pyenv init --path)"
else
    curl https://pyenv.run | bash
fi

if command -v /usr/bin/exa &> /dev/null
then
    alias ls="exa --icons"
    alias la="exa -a --icons"
    alias ll="exa -l --icons"
    alias lal="exa -la --icons"
else
    alias la="ls -a"
    alias ll="ls -l"
    alias lal="ls -al"
fi

if command -v /usr/bin/nvim &> /dev/null
then
    export EDITOR='/usr/bin/nvim'
elif command -v /usr/bin/vim &> /dev/null
then
    export EDITOR='/usr/bin/vim'
else
    export EDITOR='/usr/bin/vi'
fi


alias vi="$EDITOR"
alias vim="$EDITOR"
alias nv="$EDITOR"
alias nvim="$EDITOR"
alias e="$EDITOR"

alias explorer="explorer.exe ."

alias cls="clear"

alias vrc="$EDITOR ~/.vimrc"
alias nrc="$EDITOR ~/.config/nvim/"
alias zrc="$EDITOR ~/.zshrc"
alias trc="$EDITOR ~/.tmux.conf"

alias ss="source ~/.zshrc"
alias st="tmux source-file ~/.tmux.conf"

alias ...="cd ../.."
alias ....="cd ../../.."

alias gs="git status"
alias ga="git add"
alias gc="git add . && git commit"

alias dcr='docker-compose up -d'
alias dcb='docker-compose build'
alias dcp='docker ps'

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

list_proxy(){
    echo $ftp_proxy
    echo $http_proxy
    echo $https_proxy
    echo $no_proxy
    echo $rsync_proxy
    echo $FTP_PROXY
    echo $HTTP_PROXY
    echo $HTTPS_PROXY
    echo $NO_PROXY
    echo $RSYNC_PROXY
}

unset_proxy(){
    unset ftp_proxy
    unset http_proxy
    unset https_proxy
    unset no_proxy
    unset rsync_proxy
    unset FTP_PROXY
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset NO_PROXY
    unset RSYNC_PROXY
}

set_proxy(){
    export ftp_proxy="ftp://192.168.0.30:3128/"
    export http_proxy="http://192.168.0.30:3128/"
    export https_proxy="http://192.168.0.30:3128/"
    export no_proxy="localhost,127.0.0.1,192.168.1.1,::1,*.local"
    export rsync_proxy="rsync://192.168.0.30:3128/"
    export FTP_PROXY="ftp://192.168.0.30:3128/"
    export HTTP_PROXY="http://192.168.0.30:3128/"
    export HTTPS_PROXY="http://192.168.0.30:3128/"
    export NO_PROXY="localhost,127.0.0.1,192.168.1.1,::1,*.local"
    export RSYNC_PROXY="rsync://192.168.0.30:3128/"
}

activate(){
    if [ -f $PWD/.venv/bin/activate ]; then
        source $PWD/.venv/bin/activate
        echo $(which python) >&2
    else
        echo "não existe ambiente python" >&2
    fi
}

pyclean(){
    find . -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
}

attach_shell(){
    conteineres=$(docker ps --format '{{.Names}}')

    if [[ $? -ne 0 ]]
    then
        echo "Não existe um instância de Docker Desktop rodando na máquina"
        return 1
    fi

    conteiner=$(echo $conteineres | fzf)

    if [[ $? -ne 0 ]]
    then
        echo "Não houve uma escolha válida de contêiner"
        return 1
    fi

    docker exec -i -t $conteiner /bin/bash
}

