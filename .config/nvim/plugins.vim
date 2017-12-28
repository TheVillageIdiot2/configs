call plug#begin('~/.config/nvim/plugged')

" Use single quotes to import plugins
" Examples:
" A colorscheme in local directory
" Plug 'junegunn/seoul256.vim'
" A simple addon in a local directory
" Plug 'junegunn/vim-easy-align'
"
" Grouped dependencies: below, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" On-Demand loading
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" Using git url
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" Using options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Here begins my conquest
  Plug 'https://github.com/rust-lang/rust.vim.git', { 'do': ':UpdateRemotePlugins' }
  Plug 'https://github.com/Shougo/deoplete.nvim.git', { 'do': ':UpdateRemotePlugins' } | Plug 'https://github.com/sebastianmarkow/deoplete-rust.git', { 'do': ':UpdateRemotePlugins' }

  Plug 'https://github.com/altercation/vim-colors-solarized.git'
  Plug 'https://github.com/Konfekt/FastFold.git'
  Plug 'https://github.com/tmhedberg/SimpylFold.git'
call plug#end()


source ~/.config/nvim/complete.vim
source ~/.config/nvim/colors.vim
source ~/.config/nvim/folding.vim
