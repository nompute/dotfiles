if test ! "$(which rbenv)"; then
    echo "Installing rbenv..."

    if [ "$(uname -s)" == "Darwin" ]; then
        brew install rbenv
    else
        curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
    fi
    echo "..done!"
fi
