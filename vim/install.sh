if ! [ -d "$HOME/.vim/bundle" ]; then
    echo "Creating $HOME/.vim/bundle directory..."
    mkdir -p "$HOME/.vim/bundle"
fi

if ! [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "Cloning Vundle..."
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
