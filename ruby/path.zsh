if [[ "$(uname -s)" == "Darwin" ]]; then
    export RBENV_ROOT="/usr/local/opt/rbenv"
else
    export RBENV_ROOT="${HOME}/.rbenv"
fi
export PATH="$RBENV_ROOT/bin:$PATH"
