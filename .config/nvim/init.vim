"Set python provider
let g:python_host_prog  = "/usr/bin/python2"
let g:python3_host_prog  = "/usr/bin/python3"

"Import plugins
source ~/.config/nvim/plugins.vim

"Enable syntax parsing/highlighting
syntax on

"Go fast by sending more chars at a time, and only redrawing whats necessary
" set ttyfast

"Don't use vi settings
"set nocompatible
set encoding=utf-8

"Use mouse
set mouse=a

"Visual stuff
"set termguicolors
set background=dark

"Enable marks persistence
set viminfo='1000,f1,n~/.nviminfo
"The f1 makes file marks persist between sessions

"Tabbing and stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"Use comma for special <leader> commands
let mapleader = ","

set cursorline	"Highlight current line

"Tweak line numbering to be relative, write current to current line
if exists("+rnu")
    "Set relative
    set rnu
    "Set current line
    set nu
else
    "Otherwise just show line numbers
    set number
endif


"Enable contextual filetype settings
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on
set autoindent

"Visual helpers
set wildmenu	"visual tab complete
set showmatch	"Show matching parens, etc

"Search helpers
set incsearch	"Search as you type
set hlsearch	"Highlight matches
nnoremap <leader><space> :nohlsearch<CR>

"Move vertically by visual line
nnoremap j gj
nnoremap k gk

"Folding
set foldmethod=syntax
set foldlevel=2
set foldlevelstart=2
nnoremap <space> za

"Quick edit configs:
nnoremap <leader>ev :vsplit ~/.config/nvim/<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

"Quick escape
inoremap jk <esc>

"Fuck the command binds holy shit
noremap Q q
noremap q: :

"Quick navigation to start/end of line, top/bottom of page with shift nav
nnoremap H ^
"nnoremap J <C-D>
"nnoremap K <C-U>
nnoremap L A<esc>

"Filetype specific stuff
augroup cplusplus
    autocmd!
    autocmd BufNewFile,BufRead *.tpp set filetype=cpp "Alias tpp to be cpp
augroup END

augroup java
    autocmd!
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    "    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
augroup END

autocmd BufNewFile,BufRead js,jsx,html set filetype=htmls
augroup htmljs
    autocmd!
    autocmd FileType html setlocal foldmethod=syntax
    autocmd FileType html setlocal tabstop=2
    autocmd FileType html setlocal softtabstop=2
    autocmd FileType html setlocal shiftwidth=2
    autocmd FileType html setlocal expandtab
augroup END

autocmd BufNewFile,BufRead makefile set filetype=Makefile 
augroup makefiles
    autocmd!
    autocmd FileType makefile setlocal noexpandtab
augroup END

augroup pythonscripts
    autocmd!
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
augroup END

augroup shellscripts
    autocmd!
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

augroup rust
    autocmd!
    autocmd BufEnter *.rs let g:syntastic_rust_checkers = ['rustc']
    autocmd BufEnter *.rs let g:syntastic_quiet_messages = {"regex": 'find crate for'}
    autocmd BufEnter *.rs let g:rustfmt_autosave = 1
    autocmd BufEnter *.rs let g:racer_cmd = "/usr/bin/racer"
    autocmd BufEnter *.rs set hidden
    autocmd BufEnter *.rs let g:racer_experimental_completer = 1
augroup END

