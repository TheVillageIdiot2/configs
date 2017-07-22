#############
#Basic aliases
#############
#Config files
alias vim="nvim"
alias vimzsh="nvim ~/.zshrc"
alias vimi3="nvim ~/.config/i3/config"
alias vimrc="nvim ~/.config/nvim/"
#alias vimxres="vim /xres/Xresources"
#alias vimevil="vim /home/jchenry/code/opsrcmods/evilvte/src/config.h"
alias loadxres="xrdb ~/.Xresources"

#Connection stuff
alias cnctwpi="cat /root/wpi_cnct_cmds.txt | zsh"
alias cnctjeh="cat /root/home_cnct_cmds.txt | zsh"
alias cncttucker="cat /root/tucker_cnct_cmds.txt | zsh"
alias cnct="cncttucker"

#Misc
alias atom="atom-git"
alias dup="(urxvt &)"

#############
#PREZTO
#############
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" 
