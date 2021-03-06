source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/config.zsh
source ~/.dotfiles/zsh/functions.zsh
source ~/.dotfiles/zsh/path-exports-options.zsh
source ~/.dotfiles/zsh/secret-exports.zsh
source ~/.dotfiles/zsh/zsh-configuration.zsh
source ~/.dotfiles/zsh/theme.zsh

autoload -U colors && colors
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

bindkey -v
bindkey -e

autoload -U edit-command-line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

zle -N edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey '\C-x\C-e' edit-command-line

[ -f "/etc/grc.zsh" ] && source "/etc/grc.zsh"

precmd() {
  case $TERM in
    xterm*)
      precmd () {print -Pn "\e]0;%n@%m: %~\a"}
    ;;
  esac
}
