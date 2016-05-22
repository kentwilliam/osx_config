" CHEAT SHEET (reminders for a rainy day)
"
" "*y
"     yank to global clipboard (for pasting in other apps)
"
" cgn<replacement><Esc>....
"     replace multiple. Start by searching for something, then mark the first
"     occurrence and use cgn to replace all

" LOAD PLUGINS
" ============
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin manager
Plugin 'VundleVim/Vundle.vim'

" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Syntax checking for various languages
Plugin 'scrooloose/syntastic'

" Fuzzy find-anything
Plugin 'ctrlp.vim'

" Language support for non-bundled languages
Plugin 'kchmck/vim-coffee-script'
Plugin 'plasticboy/vim-markdown'
Plugin 'lambdatoast/elm.vim.git'

" Fast folder (multi-file) search
Plugin 'mileszs/ack.vim'

" Better ES6 syntax highlighting
Plugin 'othree/yajs.vim'

" Color schemes forever!
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-misc'
Plugin 'vim-colorscheme-switcher'

" Code completion
"Plugin 'Valloric/YouCompleteMe'

" Provides simpler ways to comment/uncomment lines
Plugin 'scrooloose/nerdcommenter'

" Cooler status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Code alignment
Plugin 'godlygeek/tabular'

" Better buffer explorer
"Plugin 'fholgado/minibufexpl.vim'
call vundle#end()
filetype indent plugin on



" GENERAL CONFIGURATION
" =====================

" No line numbers by default
"set nonumber
set number

" Highlight current line, which is obviously desirable
set cul

" Colors
set t_Co=256
set hlsearch
"colorscheme inkpot
"colorscheme flatcolor
colorscheme newspaper

" Syntax coloring is a must
syntax on

" Raw text files should behave differently than code.
" Wrap by whole words, get markdown coloring for both txt and md, and activate
" spell checker
au BufRead,BufNewFile *.txt set filetype=markdown | setlocal wrap linebreak nolist spell spelllang=en_us
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist spell spelllang=en_us

" Anything else, of course, does not wrap by default
set nowrap

" Search
set incsearch
set ignorecase       " when searching, ignore case ...
set smartcase        " except if the search term includes uppercase letters

" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Include one blank line at end of all files
set endofline

" Various
set hidden

" Show wildcard options above command line
set wildmenu

" Show unfinished command in bottom right corner of the screen
set showcmd

" Allow backspace to work similarly to desktop editors
set backspace=indent,eol,start

" Left/right wrap as you'd expect
set whichwrap+=h,l

" One blank space on the left to give the text a bit of room to breathe
set foldenable
set foldlevelstart=20
set foldcolumn=1

" Auto indent new lines
set autoindent

" Don't automatically try to move the cursor to the 'start' of the line
set nostartofline

" Always show a status line
set laststatus=2

" Be helpful by asking the user to confirm instead of failing certain actions
set confirm

" Don't make sounds, make flashes
set visualbell
set noerrorbells

" Allow mice
set mouse=a

" Command line height
set cmdheight=2

" When inputting commands, give the user some time to think
set notimeout ttimeout ttimeoutlen=200

" Use two spaces for tabs, and expand tabs to use spaces instead
set shiftwidth=2
set softtabstop=2
set expandtab

" Store undo history in temp files
set undofile

" Don't redraw mid-macro
" set lazyredraw

" Vertical git diff
set diffopt+=vertical

" Show file explorer in a split panel
let g:netrw_liststyle=3

" Remember more
set history=1000
set undolevels=1000

" Ignore some files
set wildignore=*.swp,*.bak,*.pyc,*.class

" Reflect Vim's status in the terminal title bar
set title

" No backup files will be kept around after successful writes
set nobackup

" Don't use swap files
set noswapfile



" GLOBAL SHORTCUTS
" ================

" More convenient leader (key needed to press for some combinations)
let mapleader=","

" Ctrl+space = close active window, tab, or Vim
nnoremap <NUL> :q<CR>
" Shift+space = close window and buffer
nnoremap <Leader><Space> :bd<CR>

" ,+delete = delete current file and close it
"nnoremap <leader>delete :call delete(expand('%')) | bdelete!

" Clear highlighted search hits with ,+' (keys are next to each other
" on the keyboard in Dvorak)
nnoremap <leader>' :nohl<CR>

" Ctrl+p opens fuzzy search
map <C-p> :CtrlP<CR>

" Ctrl+t = new tab with fuzzy search active (speeds up flow)
map <C-t> :tabnew<CR><C-p>

" Ctrl-y = search all files
"map <C-y> :Ack<space>
map <C-y> :Ack<space>-Q<space>'

" Ctrl+n = new tab with all-files search active (speeds up flow)
map <C-n> :tabnew<CR>:Ack<Space>

" Ctrl+e = show file explorer (tree view)
nnoremap <C-e> :Lexplore<CR>:vertical<Space>resize<Space>50<CR>

" Fugitive -- show a bit more than normal
nmap <leader>gs :Gstatus<CR><C-w>20+
nmap <leader>gpush :Gpush<CR>
nmap <leader>gpom :Git pull origin master<CR>

" Insert space in normal mode with ,+space
"nnoremap <leader><space> i<space><esc>

" ,+s = save session -- to open vim with saved session, `vim -S`
nnoremap <leader>s :mksession!<CR>

" F12 shows/hides line numbers
nnoremap <F12> :set invnumber<CR>

" F11 = toggle paste/nopaste mode
set pastetoggle=<F11>

" Simlify tab navigation—TAB key cycles tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap tn :tabnew<CR>

" Copy all
nnoremap <leader>a ggVGy

" ,+O and ,+o to insert lines without entering insert mode
nmap <Leader>O O<Esc>
nmap <Leader>o o<Esc>

" Leader + x = swap lines
nnoremap <leader>x ddp
nnoremap <leader>X ddkP

" Make it easier to hit that damn : button
nnoremap ; :

" And don't start recording by mistake
map q <Nop>

" Avoid typo when trying to save (I don't know what :W does anyway)
nnoremap :W :w

" Leader + t = trim spaces from line ends
nnoremap <Leader>t :%s/ \+$//<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Instead of 'yank line', 'yank to end of line' to be consistent with D
map Y y$

" 0 goes to first first non-blank character
map 0 ^

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Ctrl+direction keys jumps to the split window in that direction
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Editing .vimrc should be easy
nnoremap <leader>vv :tabnew $MYVIMRC<CR>
nnoremap <leader>vs :so $MYVIMRC<CR>

" Easier arrow function debugging in ES6
" (Since otherwise debugging arrow functions requires inserting {} and
" return)`
nnoremap <leader>b i(a => {debugger})() \|\|

" BUFFERS
" =======

" Show all buffers (using default buffer list)
nnoremap <F2> :buffers<CR>:buffer<Space>

" Quick navigation to buffers
nnoremap <F1> :buffer<Space>

" Toggle nice buffer explorer
"nnoremap <F10> :MBEToggleAll<CR>

" Buffer explorer is sized small and on the right of the content
"let g:miniBufExplVSplit=30
"let g:miniBufExplBRSplit = 1

" PLUGIN CONFIGURATION
" ====================

" Use Silver Surfer for faster folder search
let g:ackprg = 'ag --nogroup --nocolor --column'

" Sublime text style search-all using CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\.git$\|node_modules$\|public$\|tmp$\|bin$'

" Syntastic configuration
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_loc_list_height = 1
let g:syntastic_auto_loc_list = 0
"let g:syntastic_echo_current_error = 0



" MISC CONFIGURATION
" ==================

" Configure what to show in the title bar
let &titlestring = "vim(" . expand("%:t") . ")"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif
