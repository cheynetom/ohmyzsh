#This file is ~/.config/ohmyzsh/zshrc
#~/.zshrc is a link to this

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/ohmyzsh

#set vim as editor
export EDITOR=/bin/vim

#Change the path for .zcompdump cache to keep home dir clean.
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="%F @ %T"
MAGIC_ENTER_GIT_COMMAND='git status -u .'
MAGIC_ENTER_OTHER_COMMAND='ls -lh .'

plugins=(aliases\
	alias-finder\
	colored-man-pages\
	common-aliases\
	man\
	magic-enter\
	#per-directory-history\
	podman\
	ssh\
	#sudo\ 
	systemd\
	toolbox\
	vi-mode\
	z\
	zsh-autosuggestions\
	#zsh-interactive-cd\
	zsh-navigation-tools\
       	zsh-syntax-highlighting\
)
source $ZSH/custom/plugins/zsh-completion-generator/zsh-completion-generator.plugin.zsh
source $ZSH/oh-my-zsh.sh


#zsh-autocomplete
zstyle ':autocomplete:*' min-input 2
zstyle ':autocomplete:*' delay 1 


#zsh tab completions
zstyle ':completion:*' auto-description '::%d'
zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' format '%d'
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true

#alias-finder
zstyle ':omz:plugins:alias-finder' autoload yes
zstyle ':omz:plugins:alias-finder' longer yes
zstyle ':omz:plugins:alias-finder' exact yes
zstyle ':omz:plugins:alias-finder' cheaper yes


autoload zmv
#vim keybindings
bindkey -v

#Vi mode cursor
#- 0, 1 - Blinking block
#- 2 - Solid block
#- 3 - Blinking underline
#- 4 - Solid underline
#- 5 - Blinking line
#- 6 - Solid line

VI_MODE_SET_CURSOR=true
VI_MODE_CURSOR_INSERT=5 
VI_MODE_CURSOR_VISUAL=2 
VI_MODE_CURSOR_NORMAL=0 
VI_MODE_CURSOR_OPPEND=6

#zsh-autosuggestions keybindings
#alt+l
bindkey '^[l' autosuggest-accept
#alt+;
bindkey '^[;' autosuggest-execute

#zsh-autosuggetsions style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

#zsh-navigation-tools 
#bind control+K to znt-kill-widget
zle -N znt-kill-widget
bindkey "^K" znt-kill-widget
#bind alt+j to znt-cd-widget
zle -N znt-cd-widget
bindkey "^[j" znt-cd-widget
#
#
#styling
#Setting options
#Enable extended globbing so I can use the "^" negative glob
setopt EXTENDED_GLOB
#Make completion list more compact
setopt LIST_PACKED

#zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp cursor)
typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('sudo *' 'bg=red,fg=black')
ZSH_HIGHLIGHT_PATTERNS+=('rm *' 'fg=9,standout')


#man.plugin.zsh
bindkey '^h' man-command-line
umask 027

#Set dircolors
source $ZSH/custom/dircolors.zsh

[[ ! -f $ZSH/custom/themes/p10k.zsh ]] || source $ZSH/custom/themes/p10k.zsh

#set tmux alias to create per container sockets
alias tmux="tmux -L ${USER}_${CONTAINER_NAME}"
