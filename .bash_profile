# .bash_profile

SHELL="$(which bash)"

if [[ -f "$HOME/.profile" ]]; then
    source "$HOME/.profile"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
