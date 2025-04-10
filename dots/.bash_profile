# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
PATH="$PATH:/usr/local/go/bin"
. "$HOME/.cargo/env"
