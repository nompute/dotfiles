if test ! "$(which rbenv)"; then
    echo "Installing rbenv..."
    curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
    echo "..done!"
fi
