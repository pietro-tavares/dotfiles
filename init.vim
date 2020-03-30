set nocompatible            " required
filetype off                " required

syntax on
colorscheme space-vim-dark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

set exrc 
set secure
set number
set tabstop=4
set expandtab
set shiftwidth=4
set encoding=utf-8
set noshowmode

call plug#begin('~/.vim/plugged')
" Visuals and Behavior
Plug 'liuchengxu/space-vim-dark'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'psliwka/vim-smoothie'

" Linting and Autocompletion
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-jedi'

" Utilities
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Languages
Plug 'fatih/vim-go'
Plug 'chr4/nginx.vim'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install', 
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'aml', 'html'] }
call plug#end()


" ALE
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" Lightline (+ ALE!)
"" 1. Register the lightline and components
let g:lightline = {
    \ 'colorscheme':  'deus',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
    \ },
    \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
"" 2. Set color to the components
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
"" 3. Add the components to the right side of lightline
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

"" Find Files (ff) using SPC-f-f
nnoremap <Space>ff :Files<cr>
"" Find in All Files (fa) using SPC-f-a
nnoremap <Space>fa :Rg<Cr>

" Use the minus (-) for folding/unfolding
set foldmethod=indent
set foldlevel=99
nnoremap - za

" Go
let g:go_fmt_command = "goimports"
au BufNewFile,BufRead *.go
    \ nnoremap <F1> :GoBuild             -short<cr> |
    \ nnoremap <F2> :GoCoveraggeToggle   -short<cr> |
    \ nnoremap <F3> :GoTest              -short<cr> |
    \ nnoremap <F4> :GoRun               -short<cr> |
    \ nnoremap <F5> :GoDef               -short<cr> |
    \ nnoremap <F6> :GoDoc               -short<cr> |  
    \ nnoremap <F7> :GoDocBrowser        -short<cr> 
au BufNewFile,BufRead *.go
    \ set noexpandtab     |
    \ set shiftwidth=4    |
    \ set softtabstop=4   |
    \ set tabstop=4

" Javascript
let g:ale_fixers = { 'javascript': ['eslint'] }
au BufNewFile,BufRead *.js
    \ set tabstop=2       |
    \ set shiftwidth=2    |
    \ set expandtab       |
    \ set fileformat=unix 


" Python (PEP8 indentation)
au BufNewFile,BufRead *.py
    \ set tabstop=4       |
    \ set softtabstop=4   |
    \ set shiftwidth=4    |
    \ set expandtab       |
    \ set autoindent      |
    \ set fileformat=unix 

" [Python] virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" [Python] Auto-complete

" [Python] Linter + format-on-save

filetype plugin indent on   " required

