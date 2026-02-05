call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'jiangmiao/auto-pairs'

Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'rhysd/vim-clang-format'
Plug 'bfrg/vim-cpp-modern'

Plug 'tomasiser/vim-code-dark'
Plug 'NLKNguyen/papercolor-theme'
Plug 'hzchirs/vim-material'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gmr458/vscode_modern_theme.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'preservim/nerdcommenter'

" Initialize plugin system
call plug#end()


set nocompatible
set backspace=indent,eol,start

filetype on
filetype plugin on

syntax on

set tabstop=4

set softtabstop=4
set shiftwidth=4

set expandtab

set smarttab

set number

set showmatch

set hlsearch
set incsearch

set ignorecase
set smartcase

set autoindent
set smartindent

set mouse=c

set cursorline

set noswapfile

" remap quick keys
let mapleader=","

let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

let g:ycm_enable_diagnostic_highlighting = 0

" use space to save
nmap <leader><space> :w<cr>

" vertical split
nmap <leader>wv <C-w>v

" horizontal split
nmap <leader>ws <C-w>s

" close splitted window
nmap <leader>wc <C-w>c

" go to right window
nmap <leader>wl <C-w>l
" go to left window
nmap <leader>wh <C-w>h
" go to up window
nmap <leader>wk <C-w>k
" go to bottom window
nmap <leader>wj <C-w>j

" go to next window
nmap <leader>ww <C-w>w

" open Taglist window
nmap <leader>tl :TlistToggle<cr>

" open nerdtree window
nmap <leader>nt :NERDTreeToggle<cr>

" quit vim
nmap <leader>qq :q!<cr>
nmap <leader>x :x<cr>

" Leaderf settings
nnoremap <silent> <leader>f :Leaderf file<CR>
nnoremap <silent> <leader>u :Leaderf file<CR>
nnoremap <silent> <leader>rg :Leaderf rg<CR>

map <leader>p :Files<CR>
map <leader>b :Buffers<CR>

" code jump
let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = '/Users/wuchangsong/Workspaces/Tools/clang+llvm-16.0.5/bin/clangd'
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gm :YcmCompleter GoToImprecise<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

" code format
let g:clang_format#detect_style_file=1
let g:clang_format#code_style='llvm'
let g:clang_format#auto_format=1
"let g:clang_format#style_options = {"Standard" : "C++17"}


"""""""""""""""""""""""""""""""""""""""""""
" cscope setting
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any datebase in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the file type to enable syntax highlight
autocmd BufRead,BufNewFile *.h.inc,*.cpp.inc set filetype=cpp

augroup Binary
au!
au BufReadPre  *.bin let &bin=1
au BufReadPost *.bin if &bin | %!xxd
au BufReadPost *.bin set ft=xxd | endif
au BufWritePre *.bin if &bin | %!xxd -r
au BufWritePre *.bin endif
au BufWritePost *.bin if &bin | %!xxd
au BufWritePost *.bin set nomod | endif
augroup END

set background=dark
colorscheme dracula

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   },
  \   'language': {
  \     'haskell': {
  \       'no_bold_types' : 1
  \     },
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

hi Comment guifg='Cyan'
