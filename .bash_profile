export PS1="[\u@\h \W]\$ "
export DISPLAY=:0
export HISTTIMEFORMAT="%h/%d/%y-%H:%M:%S "
export HISTCONTROL=ignoreboth
export HISTSIZE=5000000
export HISTFILESIZE=5000000

export PATH=$PATH:/Developer/usr/bin

# For Fink
source /sw/bin/init.sh

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias apg='apg -a 0 -m 12 -x 12 -l'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport'

# User specific aliases and functions
function mtssh ()
{   
    /usr/bin/ssh -p 19635 $1
}

function work ()
{

cat << HOSTS >> /etc/hosts
## START-GTD
127.0.0.1 news.ycombinator.com news.ycombinator.org
127.0.0.1 www.engadget.com engadget.com
127.0.0.1 reddit.com www.reddit.com
127.0.0.1 forums.somethingawful.com somethingawful.com
127.0.0.1 digg.com www.digg.com
127.0.0.1 break.com www.break.com
127.0.0.1 infoq.com
127.0.0.1 twitter.com
127.0.0.1 facebook.com www.facebook.com
127.0.0.1 blip.com www.blip.com
127.0.0.1 youtube.com www.youtube.com
127.0.0.1 vimeo.com www.vimeo.com
127.0.0.1 flickr.com www.flickr.com
127.0.0.1 slashdot.com www.slashdot.com slashdot.org www.slashdot.org
## END-GTD
HOSTS

/usr/bin/dscacheutil -flushcache

}

function play()
{
fun
}

function fun () 
{

cat /etc/hosts > /tmp/hosts
/usr/bin/sed -i "" "/^## START-GTD.*/,/## END-GTD.*/d" /tmp/hosts
cat /tmp/hosts > /etc/hosts

/usr/bin/dscacheutil -flushcache

}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export CC=gcc-4.2

# Path ------------------------------------------------------------
if [ -d ~/.local/bin ]; then
  export PATH=~/.local/bin:$PATH
fi

  # Python path -----------------------------------------------------
if [ -d ~/.local/lib/python2.7/site-packages ]; then
  export PYTHONPATH=~/.local/lib/python2.7/site-packages:$PYTHONPATH
fi

# Turn on advanced bash completion if the file exists
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# Locate virtualenvwrapper binary
if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
  export VENVWRAP=~/.local/bin/virtualenvwrapper.sh
fi

if [ ! -z $VENVWRAP ]; then
  # virtualenvwrapper -------------------------------------------
  # make sure env directory exits; else create it
  [ -d $HOME/sites/env ] || mkdir -p $HOME/sites/env
  export WORKON_HOME=$HOME/sites/env
  source $VENVWRAP

  # virtualenv --------------------------------------------------
  export VIRTUALENV_USE_DISTRIBUTE=true

  # pip ---------------------------------------------------------
  export PIP_VIRTUALENV_BASE=$WORKON_HOME
  export PIP_REQUIRE_VIRTUALENV=true
  export PIP_RESPECT_VIRTUALENV=true
  export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
fi
