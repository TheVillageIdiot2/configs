"deoplete configuration
"Enable with lazy loading, basically
let g:deoplete#enable_at_startup = 1

"Use smartcase
let g:deoplete#enable_smart_case = 1

"Begin generation of omni patterns
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

"If we ever want to disable autocomplete, do let
"g:deoplete#disable_auto_complete = 1

"Autoclose menu
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Set tab to complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""""""""""""""""""""LANGUAGE SPECIFICS"""""""""""""""""""""""""""
"setup omnifuncs
augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html, markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"Setup for rust
let g:deoplete#sources#rust#racer_binary='/usr/local/bin/racer'
let g:deoplete#sources#rust#rust_source_path='$RUST_SRC_PATH'
"Uncomment below to disable default keybinds of:
"gd = go to definition in normal mode
"K = show documentation under cursor
"let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#documentation_max_height=20
