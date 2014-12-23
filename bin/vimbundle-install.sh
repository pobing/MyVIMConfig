#!/bin/bash

# Set up pathogen:
pathogen=~/.vim/autoload/pathogen.vim
if [ ! -f $pathogen ]; then
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso $pathogen https://tpo.pe/pathogen.vim
fi

plugins="
scrooloose/nerdtree
mileszs/ack.vim
kien/ctrlp.vim
vim-scripts/Align
vim-scripts/tComment
Yggdroot/indentLine
lilydjwg/colorizer
vimwiki/vimwiki
leafgarland/typescript-vim
kchmck/vim-coffee-script
pangloss/vim-javascript
groenewege/vim-less
briancollins/vim-jst
wavded/vim-stylus
fatih/vim-go
digitaltoad/vim-jade
juvenn/mustache.vim
jayferd/eco.vim
nono/vim-handlebars
cespare/vim-toml
tpope/vim-markdown
ekalinin/Dockerfile.vim
evanmiller/nginx-vim-syntax
"

for plugin in $plugins; do
  name=${plugin##*/}

  if [ -d ~/.vim/bundle/$name ]; then
    echo "Update $name";
    cd ~/.vim/bundle/$name && git pull origin master;
  else
    echo "Install $name";
    cd ~/.vim/bundle && git clone git://github.com/${plugin}.git;
  fi
done


