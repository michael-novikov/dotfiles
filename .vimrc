" VIM Configuration - mnovikov

set nocompatible " Cancel the compatibility with Vi. Essential if you want to enjoy the features of Vim

" -- Vundle setup
filetype off    " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'ycm-core/YouCompleteMe' " Autocompletion
Plugin 'preservim/nerdtree' " NERDTree
Plugin 'mbbill/undotree' " The undo history visualizer for VIM

" Airline
Plugin 'vim-airline/vim-airline' " Lean & mean status/tabline for vim that's light as air.
Plugin 'vim-airline/vim-airline-themes' " Install also: github.com/powerline/fonts
Plugin 'bling/vim-bufferline' " Integrated with Airline

" Buffers
Plugin 'moll/vim-bbye' " allows you to do delete buffers without closing your windows or messing up your layout
Plugin 'jlanzarotta/bufexplorer'

" Searching
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'albfan/ag.vim' " First, install the_silver_searcher via package manager

Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/vim-colon-therapy'

" Colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

" C++ plugins
" Plugin 'LucHermitte/lh-vim-lib'
" Plugin 'LucHermitte/lh-style'
" Plugin 'LucHermitte/lh-tags'
" Plugin 'LucHermitte/lh-dev'
" Plugin 'LucHermitte/lh-brackets'
" Plugin 'LucHermitte/searchInRuntime'
" Plugin 'LucHermitte/mu-template'
" Plugin 'tomtom/stakeholders_vim'
" Plugin 'LucHermitte/alternate-lite'
" Plugin 'LucHermitte/lh-cpp'

" All of your Plugins must be added before the following line
call vundle#end()

" -- Vundle setup end

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

" -- Code
syntax enable " Enable syntax highlighting
set showmatch " show matching brackets
set cc=80 " set a column border for good coding style
" set autochdir " sets the cwd to whatever file is in view. This allows better omni completion.

" Do not use marks in lh-cpp plugin
" let g:usemarks=0

" -- Color scheme
set termguicolors
let g:gruvbox_italic=1
set background=dark " Use the dark version of colorscheme
colorscheme gruvbox

" -- Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" -- Bufferline
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
    \ .bufferline#get_status_string()

" -- NERDTree
" autocmd vimenter * NERDTree " Open NERDTree plugin at start
let NERDTreeMinimalUI = 1

" -- Undotree
set nobackup
set undodir=~/.vim/undodir
set undofile

" -- GUI specific options
if has("gui_running")
  set guifont=Monaco:h14
  set guioptions=T " Enable the toolbar
endif

" -- Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent " indent a new line the same amount as the line just typed
" set expandtab " converts tabs to white space

" ag items. I need the silent ag.
if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore "
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache "
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ag_working_path_mode="r"

" -- YCM
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Termdebug
packadd termdebug

" -- Mappings
let mapleader = " "

nmap ; :

noremap <silent> <leader>[ :set background=dark<CR>
noremap <silent> <leader>] :set background=light<CR>

" Disabling the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

if has('nvim')
  " Remove from terminal mode with Esc key
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Easy windows switching with leader key
nmap <c-h> :wincmd h<CR>
nmap <c-j> :wincmd j<CR>
nmap <c-k> :wincmd k<CR>
nmap <c-l> :wincmd l<CR>
if has('nvim')
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-l> <c-\><c-n><c-w>l
endif

" Maps to resizing a window split
map - <C-W>-
map = <C-W>+
map _ <C-w><
map + <C-w>>

" Clear the last search
noremap <silent> <leader>/ :let @/ = ""<CR>

nmap <leader>pf :CtrlP<CR>
nnoremap <leader>gd :GoDef<Enter>
nnoremap <leader>pt :NERDTreeToggle<Enter>
nnoremap <leader>pw :NERDTreeToggleVCS<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

" Open Undotree
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" YCM
nnoremap <silent> <leader>gr :YcmForceCompileAndDiagnostics<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

" RG
" bind K to grep word under cursor
nnoremap <silent> K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>ps :Ag<SPACE>

" Bbye delete buffer
nnoremap <Leader>q :Bdelete<CR>

" Termdebug
nnoremap <F6> :Termdebug %:r<CR><c-w>2j<c-w>L<c-w>h

