if test ! "$(which pyenv)"; then
    echo "Installing pyenv..."
    if [ "$(uname -s)" == "Darwin" ]; then
        brew install pyenv
    else
        curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    fi
    echo "...done!"
fi
