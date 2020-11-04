" VIM Configuration - mnovikov

set nocompatible " Cancel the compatibility with Vi. Essential if you want to enjoy the features of Vim

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' } " Autocompletion
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree' " The undo history visualizer for VIM

" Airline
Plug 'vim-airline/vim-airline' " Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline-themes' " Install also: github.com/powerline/fonts

" Buffers
Plug 'moll/vim-bbye' " allows you to do delete buffers without closing your windows or messing up your layout
Plug 'jlanzarotta/bufexplorer'

" Searching
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'albfan/ag.vim' " First, install the_silver_searcher via package manager

" Git
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-dispatch'
Plug 'scrooloose/vim-colon-therapy'

" Colors
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

filetype plugin indent on

set exrc
set secure

" -- Display
set title                 " Update the title of your window or your terminal
set number                " Display line numbers
set relativenumber        " Display relative line numbers
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long
set noequalalways         " When closing a window the extra lines are given to the window next to it
set splitbelow            " Splitting feels more natural
set splitright            " Splitting feels more natural

set scrolloff=1           " Display at least 1 line around you cursor (for scrolling)

" -- Search
set ignorecase            " Ignore case when searching
set smartcase             " If there is an uppercase in your search term
                          " search case sensitive again
set incsearch             " Highlight search results when typing
set hlsearch              " Highlight search results

" -- Beep
set visualbell            " Prevent Vim from beeping
set noerrorbells          " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

set hidden " Hide buffer (file) instead of abandoning when switching to another buffer

"store lots of :cmdline history
set history=1000

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" -- Code
syntax enable " Enable syntax highlighting
set showmatch " show matching brackets
set cc=120 " set a column border for good coding style

" -- Color scheme
set termguicolors
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'soft' " Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_contrast_light = 'soft' " Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_italicize_comments = 0
set background=dark " Use the dark version of colorscheme
colorscheme gruvbox

" -- Airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" -- NERDTree
" autocmd vimenter * NERDTree " Open NERDTree plugin at start
let NERDTreeMinimalUI = 1

" -- Undotree
set nobackup
set undodir=~/.vim/undodir
set undofile

" -- Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent " indent a new line the same amount as the line just typed
set expandtab " converts tabs to white space

if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ --nogroup\ --nocolor\ --column
endif

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:ag_working_path_mode="r"

" -- YCM
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filepath_completion_use_working_dir = 1

" Let clangd fully control code completion
let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['-log=verbose', '-pretty']
let g:ycm_clangd_uses_ycmd_caching = 0

" Termdebug
packadd termdebug

" -- Mappings
let mapleader = " "

nmap ; :

noremap <silent> <leader>[ :set background=dark<CR>
noremap <silent> <leader>] :set background=light<CR>

" Maps to resizing a window split
map - <C-W>-
map = <C-W>+
map _ <C-w><
map + <C-w>>

" Clear the last search
noremap <silent> <leader>/ :let @/ = ""<CR>

nnoremap <silent> <leader>pf :Files<CR>
nnoremap <silent> <leader>gd :GoDef<Enter>
nnoremap <silent> <leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <leader>pw :NERDTreeToggleVCS<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

" Open Undotree
nnoremap <silent> <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>

" YCM
nnoremap <silent> <leader>gg :YcmForceCompileAndDiagnostics<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

" bind F to grep word under cursor
nnoremap <silent> F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>ps :Ag<SPACE>

" Bbye delete buffer
nnoremap <silent><Leader>q :Bdelete<CR>

" Termdebug
nnoremap <silent><F6> :Termdebug %:r<CR><c-w>K<c-w>j<c-w>L<c-w>h<c-w>k

" Open terminal
nnoremap <silent> <leader>t :below terminal ++rows=10<CR>

