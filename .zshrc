#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#
#   
###############################

autoload -U promptinit
promptinit
#prompt bigfade 'red white grey white'
prompt sorin

# Completion
autoload -U bashcompinit
autoload -U incremental-complete-word
autoload -U compinit
bashcompinit
compinit -C
zmodload zsh/complist

# Language
LANG=en_US.UTF-8; export LANG
MM_CHARSET=UTF-8; export MM_CHARSET
LC_ALL=en_US.UTF-8; export LC_ALL

# Unicode
setopt printeightbit

# mv zsh
autoload zmv

# Colors
if [[ -x `which dircolors` ]]; then
    if [[ -f ~/.dir_colors ]]; then
        eval $(dircolors -b ~/.dir_colors)
    elif  [[ -f /etc/dir_colors ]]; then
        eval $(dircolors -b /etc/dir_colors)
    else
        eval $(dircolors -b)
    fi
else
    
LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';
    export LS_COLORS
fi
export ZLS_COLORS=$LS_COLORS

# Comments
setopt  interactive_comments

# completion style
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BDésolé, pas de résultats pour : %d%b'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                           /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin /home/cocky/bin

# Completion cache
zstyle ':completion:complete:*' use-cache 1
zstyle ':completion:complete:*' cache-path ~/.zsh/cache/$HOST

# History
export HISTFILE=~/.zsh/history/historique
export HISTSIZE=1000
export SAVEHIST=1000

# completion colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# autocd...
setopt autopushd pushdminus pushdsilent pushdtohome
setopt autocd
setopt hist_ignore_all_dups

# correction
setopt correctall

# better ls ;)
function ll()
{ ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| egrep -v "^d|total "; }

# cvs(1) completion
_cvs ()
{
    local cur prev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    if [ $COMP_CWORD -eq 1 ] || [ "${prev:0:1}" = "-" ]; then
        COMPREPLY=( $( compgen -W 'add admin checkout commit diff \
        export history import log rdiff release remove rtag status \
        tag update' $cur ))
    else
        COMPREPLY=( $( compgen -f $cur ))
    fi
    return 0
}
complete -F _cvs cvs

# killall completion
_killall ()
{
    local cur prev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}

    # get a list of processes (the first sed evaluation
    # takes care of swapped out processes, the second
    # takes care of getting the basename of the process)
    COMPREPLY=( $( /bin/ps -u $USER -o comm  | \
        sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
        awk '{if ($0 ~ /^'$cur'/) print $0}' ))

    return 0
}
complete -F _killall killall killps

##################################################################################
# Change the window title of X terminals 
    if [[ $TERM =~ "xterm|rxvt" ]]; then
        # There are lots of other info to add. See 'prompt expansion' in
        # man zshmisc
        precmd()  { print -Pn "\e]0;%~\a"} ;
        preexec() { print -Pn "\e]0;$1\a"} ;
    fi
##################################################################################

export GREP_COLOR=31

# Alias #
alias grep='egrep --color=auto'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias svi="sudo vim"
alias dezip="unfoo"
alias rmmod="sudo rmmod"
alias cpr="cp -R"
alias date="date +%c"
alias less="vimpager"
alias more="vimpager"
alias spaste="curl -F 'sprunge=<-' http://sprunge.us"

# Pacman
alias pac="sudo pacman"
alias pacS="sudo pacman -S"
alias pacR="sudo pacman -R"
alias pacRs="sudo pacman -Rs"
alias pacSyu="sudo pacman -Syyu"
alias pacSs="pacman -Ss"
alias pacSg="pacman -Sg"
alias pacQs="pacman -Qs"
alias pacSi="pacman -Si"
alias pacQi="pacman -Qi"
alias pacQl="pacman -Ql"
alias pacQo="sudo pacman -Qo" 
alias pacQtd="sudo pacman -Qtd"
alias pacScc="sudo pacman -Scc" 
alias pacU="sudo pacman -U"
alias pacaurS="pacaur -S"

# The 'ls' family (this assumes you use the GNU ls)
alias la='ls -Al'               # show hidden files
alias ls='ls -hF --color'    # add colors for filetype recognition
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'        # sort by change time  
alias lu='ls -lur'        # sort by access time   
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al |more'         # pipe through 'more'

# Paths
export PATH=$PATH:/home/cocky/bin/:/sbin/:/usr/sbin/:/usr/local/bin/

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

bindkey "\e[5~" history-search-backward 
bindkey "\e[6~" history-search-forward

# Pager
export PAGER=/usr/bin/vimpager
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
