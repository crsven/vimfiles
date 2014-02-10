set nocompatible

" Vundle stuff
filetype off
filetype plugin indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Bundles
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/FuzzyFinder.git'
Bundle 'vim-scripts/L9.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree.git'
Bundle 'tsaleh/vim-align.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'michaeljsmith/vim-indent-object.git'
Bundle 'benmills/vimux'
Bundle 'cloud8421/vimux-cucumber'
Bundle 'pgr0ss/vimux-ruby-test'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-rake.git'
Bundle 'mattn/emmet-vim.git'
Bundle 'jistr/vim-nerdtree-tabs.git'
Bundle 'nono/vim-handlebars'
Bundle 'ervandew/supertab.git'
Bundle 'chaquotay/ftl-vim-syntax'

" delegate configuration to files in config/
runtime! config/**/*.vim
runtime! after/**/*.vim
