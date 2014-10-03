set nocompatible
" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting
 
" don't make vim compatible with vi 

execute pathogen#infect()
syntax on
set number
 
" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on


" reload files changed outside vim
set autoread         
 
" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8
 
" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim
 
" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start
 
" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden
 
" save up to 100 marks, enable capital marks
set viminfo='100,f1
 
" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw
 
" ---------------------- CUSTOMIZATION ----------------------
"  The following are some extra mappings/configs to enhance my personal
"  VIM experience
 
" set , as mapleader
let mapleader = " "
 
" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
 
" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']
 
" hide unnecessary gui in gVim
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
end
 
" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
" use ESC to remove search higlight
nnoremap <esc> :noh<return><esc>
 
" most of the time I should use ` instead of ' but typing it with my keyabord
" is a pain, so just toggle them
nnoremap ' `
nnoremap ` '
 
" suggestion for normal mode commands
set wildmode=list:longest
 
" keep the cursor visible within 3 lines when scrolling
set scrolloff=3
 
" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=4   " in insert mode, tabs are 4 spaces
 
" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>
"  ...and in gui mode
inoremap <C-Space> <C-n>
"
" if windows...
if has('win32')
    " start maximized
    autocmd GUIEnter * simalt ~x
    " also use .vim instead of vimfiles, make sure to run the following command
    " once this was copied to /Users/<user>/.vim
    "  mklink %homepath%/.vimrc %homepath%/.vim/.vimrc
    let &runtimepath.=',$HOME/.vim'
endif
 
"--Ctrlp Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*/node*/*,*/bower*/*    " node code
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

let jshint2_read = 1
let jshint2_save = 1
let jshint2_command = '/usr/local/lib/node_modules/jshint/bin'


"Spelling settings
"set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline,bold  ctermfg=red 
hi Search cterm=NONE ctermfg=grey ctermbg=blue

"Change cursor based on insert or nav mode"
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

"remap arrow keys
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
