"enable syntax
syntax on
"enable lines numbers
set nu
"enable ruler
set ruler
"enable auto indentation
set ai

"set color scheme
colorscheme evening

set wrap

"set search highlights
set is hls ic scs magic

"change tabs to spaces
set expandtab
"set tab width
set tabstop=4
"set indentation width
set shiftwidth=4
"set tab behavior to enable backspace behavior
set softtabstop=4
"set text 'limit'
set colorcolumn=120

set fileformat=unix

"enable auto save
set autowrite

"enable all function of mouse
set mouse=a

"function to remove extra spaces
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
"call function before file save
autocmd BufWrite * :call DeleteTrailingWS()
autocmd BufNewFile,BufRead *.html.twig set syntax=html


"show the invisible chars
set list
set listchars=tab:>-,trail:·,eol:$,extends:>

set nocompatible
set history=10000

"Config to keep text selected on <, >, TAB and SHIF+TAB
vnoremap < <gv
vnoremap > >gv
vmap <TAB> >
vmap <S-TAB> <
