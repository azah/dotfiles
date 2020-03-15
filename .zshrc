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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/andrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
    #eval "$__conda_setup"
#else
    #if [ -f "/home/andrew/anaconda3/etc/profile.d/conda.sh" ]; then
        #. "/home/andrew/anaconda3/etc/profile.d/conda.sh"
    #else
        #export PATH="/home/andrew/anaconda3/bin:$PATH"
    #fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
