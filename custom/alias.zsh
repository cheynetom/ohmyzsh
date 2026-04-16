# Set personal aliases, overriding those provided by oh-my-zsh libs,
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias ls="ls --color=always -h --group-directories-first"
#alias vim="vi"

alias ls="ls --time-style=long-iso --classify=auto --human-readable --color=auto --hyperlink=auto --group-directories-first --indicator-style=file-type -v"
alias la="ls -A"
alias rm="rm -I --one-file-system -vrd"
alias thyme="/usr/bin/time -v"
alias scurl="curl --tlsv1.3 --proto https --remote-name"
alias scurl-dl="curl --tlsv1.3 --proto=https --remote-name --location"
alias dbx="distrobox"
alias ssh-keygen-fips="ssh-keygen -t ecdsa -b 256 -m pem -f"
alias ip="ip --human --pretty --color"
alias mkdir="mkdir -p"
alias makegif='ffmpeg -i $SOURCE -t $GIFLENGTH -vf "fps=5,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0'
alias mv="mv -v"
alias cp="cp -irv"
alias docker="podman"
alias docker-compose="podman-compose"
alias datenow="strftime %Y.%m.%d.%H%M"
alias cdmktemp="cd $(mktemp -d)"
#Custom functions
#cd + ls
#cl() {
#        local dir="$1"
#        local dir="${dir:=$HOME}"
#        if [[ -d "$dir" ]]; then
#                cd "$dir" >/dev/null; exa -l
#        else
#                echo "zsh: cl: $dir: Directory not found"
#        fi
#}
#funtion to ls -l after cd'ing

#ls -l after chpdw
function chpwd() {
    emulate -L zsh
    ll
}

