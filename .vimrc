set nocp
execute pathogen#infect()
syntax enable
set background=dark
colorscheme eldar
filetype plugin indent on

"NERDTree stuff
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeMouseMode=3

set mouse=a
set number
set relativenumber
set linespace=3
set ruler
set colorcolumn=80
set encoding=utf-8
set wrap
set breakindent
set formatoptions=tcqrn1
set scrolloff=1
set backspace=indent,eol,start
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"no error bell and visual bell
set noeb vb t_vb=

"highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=235

"show indentation
" set list listchars=space:·,trail:·
hi SpecialKey ctermfg=darkgray
hi Comment ctermfg=darkgray

"trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

"emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


" detect hugo/go html then set syntax
function DetectGoHtmlTmpl()
    if expand('%:e') == "html" && search("{{") != 0
        set filetype=gohtmltmpl
    endif
endfunction

augroup filetypedetect
    au! BufRead,BufNewFile * call DetectGoHtmlTmpl()
augroup END
" end detect hugo/go html then set syntax

" LSP setup for TypeScript
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif
