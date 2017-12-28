"deoplete configuration
"Enable with lazy loading, basically
let g:deoplete#enable_at_startup = 1

"Use smartcase - if a capital in input, capitals matter
"let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_ignore_case = 1

"If we ever want to disable autocomplete, do let
"let g:deoplete#disable_auto_complete = 1

"Disable deoplete omni shit, which in effect enables all of deopletes proper
"features
if exists("g:deoplete#omni_patterns")
    unlet g:deoplete#omni_patterns
endif

"Autoclose menu
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Set tab to cycle complete menu if it is visible
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""""""""""""""""""""LANGUAGE SPECIFICS"""""""""""""""""""""""""""
"Setup for rust

"The systemlist[0] trick strips newlines
let g:deoplete#sources#rust#racer_binary = systemlist("which racer")[0]
let g:deoplete#sources#rust#rust_source_path = systemlist("echo $(rustc --print sysroot)/lib/rustlib/src/rust/src")[0]
let g:deoplete#sources#rust#documentation_max_height=30

"For python(?)
