if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/richardmcdonald/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="random"

plugins=(zsh-autosuggestions)
# plugins+=(zsh-nvm)
#
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias dcom="docker-compose"
alias lzd='lazydocker'
# alias nvim='CC=/opt/homebrew/bin/gcc-12 nvim'
# alias nv='nvim'
alias nv="CC=/opt/homebrew/bin/gcc-12 nvim"
alias magit='emacsclient --tty -q -e \(magit-status\)'
alias rl='source ~/.zshrc'
alias em='emacsclient'
function tm()
{
  tmux $*
}
function emc()
{
  if [ "$1" = "." ]; then
    # Turn /User/richardmcdonald/wise/wise-api into ~/wise/wise-api so that
    # projectile matches the project name
    project=$(echo "${PWD/#$HOME/~}")
    start_at_project="'(projectile-switch-project-by-name \"$project\")'"
    echo "$start_at_project" | xargs -I {} emacsclient -tty -c -u -a "" -e {}

  else
    emacsclient -tty -u -a "" -c $*
  fi
}
# function em()
# {
#   # -c: creates a new frame
#   # -a "": starts new emacs daemon if none running
#   # -tty: opens in terminal
#   if [ "$1" = "." ]; then
#     # Turn /User/richardmcdonald/wise/wise-api into ~/wise/wise-api so that
#     # projectile matches the project name
#     project=$(echo "${PWD/#$HOME/~}")
#     start_at_project="'(projectile-switch-project-by-name \"$project\")'"
#     echo "$start_at_project" | xargs -I {} emacsclient -tty -c -u -a "" -e {}
#
#   else
#     emacsclient -tty -u -a "" -c $*
#   fi
# }
function ema()
{
  # if [ "$1" = "." ]; then
  #   # Turn /User/richardmcdonald/wise/wise-api into ~/wise/wise-api so that
  #   # projectile matches the project name
  #   project=$(echo "${PWD/#$HOME/~}")
  #   start_at_project="'(projectile-switch-project-by-name \"$project\")'"
  #   echo "$start_at_project" | xargs -I {} emacsclient -q -n -u -a "" -e {}

  # else
  #   emacsclient -c -q -n -u -a "" $*
  # fi
  cd ~
  emacsclient -c -q -n -u -a "" $*
  cd -
}

export PATH=~/.emacs.d/bin/doom:$PATH
export PATH=/usr/local/bin/aws-login:$PATH
export PATH=/usr/local/bin/build_local_images:$PATH
export PATH=/usr/local/share/dotnet:$PATH
export PATH="$HOME/.emacs.d/bin":"$PATH"
export PATH="/Applications/CMake.app/Contents/bin":"$PATH"
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export AWS_PROFILE=mfa
export PATH="$PATH:/Users/richardmcdonald/.dotnet/tools"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
