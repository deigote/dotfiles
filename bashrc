# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Fancy prompt
# PS1="\[\033[0;31m\][\$(date +%H:%M)]\[\033[0;34m\][\u@\h:\w]$\[\033[0m\] "
# PS1="\[\033[0;31m\][\$(date +%H:%M)]\[\033[0;34m\] \w \[\033[0m\]$ "
PS1="[\$(date +%H:%M)] \w $ "

# Some cool aliases and functions
alias ls='ls -GF'
alias ll='ls -lh'
alias la='ls -a'
alias l='ls -hrtal'
alias mkdir='mkdir -p'
#alias ps='ps aux -o user,uid,pid,ppid,nice,%cpu,%mem,rss,vsize,tname,etime,start_time,args'
alias ps='ps aux -o user,uid,pid,ppid,nice,%cpu,%mem,rss,vsize,etime,args'
alias psg='ps | head -n 1 && ps | grep -i'
alias hig='history | grep -i'
alias grep='grep -i --color=auto --exclude=*.svn-base'
function opendir
{
	open `dirname "$1"`
}

function ff {
	if [[ -d "$1" ]] ; then
		DIR="$1" ; shift
	else
		DIR="."
	fi
	SEARCHTERM="$1" ; shift
	cmd="find \"$DIR\" -iname '*$SEARCHTERM*' ! -name *.svn-base $@"
	echo "$cmd"
	eval "$cmd"
}

function grep-by-file-extension {
	extension=$1
	shift
	searchterm="$1"
	shift
	echo grep -R --include=*.$extension "$searchterm" $*
	grep -R --include=*.$extension "$searchterm" $*
}

function svn {
	IFS=$'\n'
	if [ "$1" == "diff" ] ; then
		shift
		`which svn` diff --diff-cmd diff -x -uw $@ | colordiff
	else
		`which svn` $@
	fi
}

function diff {
	`which diff` -x -uw $@ | colordiff
}

# Auto-correct small typos in cd command
shopt -s cdspell

# History command uses write-through append
shopt -s histappend
PROMPT_COMMAND='history -a'

# Must press ctrl-d twice to exit
export IGNOREEOF=1

# Some ssh aliases
alias ssh-deigote-com='ssh -p 443 deigote@deigote.com -t "screen -R deigote -d"'
alias ssh-deigote-com-no-screen='ssh -p 443 deigote@deigote.com'
alias ssh-deigote-com-with-tunnel='ssh -p 443 -D 9999 -L 5901:0.0.0.:5901 deigote@deigote.com'

# More tweaks are located in .inputrc, check them out if copying 
# this file to another machine

# GMV stuff (must be at the end of the file)
[[ -s "/Users/deigote/.gvm/bin/gvm-init.sh" && -z $(which gvm-init.sh | grep '/gvm-init.sh') ]] && source "/Users/deigote/.gvm/bin/gvm-init.sh"
