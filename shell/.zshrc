# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
alias df='df -h'
alias du='du -h'
alias lt='ls -ltr'
alias lx='ls -lxB'
alias lk='ls -lSr'
alias lat='ls -altr'
alias st='shuttle'

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=$HOME/.oh-my-zsh

#if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
#  ZSH_THEME="agnoster"
#else
#  ZSH_THEME="robbyrussell"
#fi
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

plugins=(brew composer git laravel5 npm tmux vagrant)

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

source $HOME/trevdev/shell/.aliases
source $HOME/trevdev/shell/.vars
[[ -s ~/.local-aliases ]] && source ~/.local-aliases


## Autojump
type brew >/dev/null 2>&1 && [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

prompt_context () { }

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
## Update $PATH for Homebrew
export PATH="/users/cyang/bin:/usr/local/sbin:$PATH:${GOPATH}/bin:${GOROOT}/bin"
export GO111MODULE="auto"
