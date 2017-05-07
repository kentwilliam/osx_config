" This file is formatted for folding by indentation

" Pre-hooks (vary by environment)
  if filereadable('~/.vimrc-pre')
    source '~/.vimrc-pre'
  endif

" Plugins
  set nocompatible
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'

    " Language support
    Plugin 'JulesWang/css.vim'
    Plugin 'chenglou/vim-reason'
    Plugin 'hhvm/vim-hack'
    Plugin 'mxw/vim-jsx'
    Plugin 'mxw/vim-xhp'
    Plugin 'pangloss/vim-javascript'

    " Navigation improvements
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'jlanzarotta/bufexplorer'
    Plugin 'lifepillar/vim-mucomplete'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'wincent/command-t'

    " Mercurial integration
    Plugin 'ludovicchabant/vim-lawrencium'
    Plugin 'mhinz/vim-signify'

    " Make gvim-only color schemes work in terminal vim
    Plugin 'godlygeek/csapprox'
  call vundle#end()
  syntax on
  filetype plugin indent on

" Leader
  " More convenient leader (key needed to press for some combinations)
  " Note: this has to come early in this file as various sections depend on
  " the defined leader
  let mapleader=","

" General configuration
  " Line numbers - relative + current line with absolute
  set relativenumber
  set number

  " Highlight current line
  set cul

  " By default, do not wrap text
  set nowrap

  " Search
  set incsearch
  set ignorecase       " when searching, ignore case ...
  set smartcase        " except if the search term includes uppercase letters

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
  set foldlevelstart=2
  set foldcolumn=1
  "set foldmethod=indent

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
  set list
  set listchars=tab:>-

  " Store undo history in temp files
  set undofile

  " Don't redraw mid-macro
  set lazyredraw

  " Vertical git diff
  set diffopt+=vertical

  " Show file explorer in a split panel
  let g:netrw_liststyle=3

  " Remember more
  set history=1000
  set undolevels=1000

  " Ignore some files
  set wildignore=*.swp,*.bak,*.pyc,*.class,*.un~,*coverage/*,*.html

  " Reflect Vim's status in the terminal title bar
  set title

  " No backup files will be kept around after successful writes
  set nobackup

  " Don't use swap files
  set noswapfile

  " Automatically resize split if window is resized
  autocmd VimResized * wincmd =

" Colors
  set background=dark
  set t_Co=256
  colorscheme woju
  " Nice ones: PaperColor, pride, satori, ashen, getafe, 256-grayvim,
  " railscasts, woju, apprentice, blackboard, morning, lightning, whitebox,
  " default, skittles_berry, visualstudio, whitebox, eink, nofrils-dark,
  " spring-night
  nnoremap <leader>q :NextColorScheme<CR>
  nnoremap <leader>; :PrevColorScheme<CR>
  let &colorcolumn=join(range(81,999),",")
  highlight ColorColumn ctermbg=234
  " light: 253

" Keyboard mappings & shortcuts
  " Easy edit/refresh .vimrc
  nnoremap <leader>vv :tabnew $MYVIMRC<CR>
  nnoremap <leader>vs :so $MYVIMRC<CR>

  " More convenient ESC
  imap jk <Esc>

  " Make it easier to hit that damn : button
  nnoremap ; :

  " Avoid typo when trying to save (I don't know what :W does anyway)
  nnoremap :W :w

  " Ctrl+direction keys jumps to the split window in that direction
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Ctrl+space = close active window, tab, or Vim. So handy.
  nnoremap <NUL> :q<CR>

  " Maximize current window (close splits and leave only active pane)
  nmap <leader>m :only<CR>

  " Faster sort
  map <leader>s :sort<CR>

" Copy and paste stuff
  " S is for 'stamp': Replace word under cursor with yanked content
  nnoremap S diw"0P

  " move vertically by visual line
  nnoremap j gj
  nnoremap k gk

  " Instead of 'yank line', 'yank to end of line' to be consistent with D
  map Y y$

" Search
  " Search for word under cursor
  noremap <C-q> :TBGS <cword><CR>

  " Clear highlighted search hits with ,+c
  nnoremap <leader>' :nohl<CR>

  " Ctrl+D to search for visual selection
  vnoremap <C-d> y/<C-R>"<CR>

" Snippets & Code generation
  " Insert JS require(): Go to the top, paste the require statement, re-sort, then re-save
  nnoremap <C-v> gg/const<Return>Oconst <C-r>" = require('<C-r>"');<Esc>V/\v^\n<Return>k:sort<Return>:w<Return>:nohl<Return>
  " Same, for react component
  nnoremap <C-z> gg/const<Return>Oconst <C-r>" = require('<C-r>".react');<Esc>V/\v^\n<Return>k:sort<Return>:w<Return>:nohl<Return>
  " Same, for brands component
  nnoremap <C-n> gg/const<Return>Oconst <C-r>" = require('<C-r>".brands');<Esc>V/\v^\n<Return>k:sort<Return>:w<Return>:nohl<Return>

" Navigation and files
  " Saving files
    " Strip trailing whitespace on save
    autocmd BufWritePre * :%s/\s\+$//e

    " Create directory when writing file
    " See http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
    function! s:MkNonExDir(file, buf) abort
        if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
            let dir=fnamemodify(a:file, ':h')
            if !isdirectory(dir)
                call mkdir(dir, 'p')
            endif
        endif
    endfunction
    augroup BWCCreateDir
        autocmd!
        autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    augroup END

  " NERDTree
    let NERDTreeWinSize = 70
    nnoremap <F3> :NERDTree<CR>:vertical resize 60<CR>
    " Show current file in tree
    nnoremap <C-f> :NERDTreeFind<CR>
    " Toggle/untoggle global tree
    map <Leader>f :NERDTreeTabsToggle<CR>

  " Command-T
    let g:CommandTMaxFiles=10000000000
    let g:CommandTFileScanner="watchman"
    nnoremap <C-t> :CommandT<CR>
    nnoremap <C-b> :CommandTBuffer<CR>

  " Buffer navigation
    noremap <C-e> :BufExplorer<CR>
    noremap <C-x> :bd<CR>
    nnoremap <leader>k :bp<CR>
    nnoremap <leader>j :bn<CR>

  " Tab navigation
    " Simlify tab navigation—TAB key cycles tabs
    nnoremap <Tab> gt
    nnoremap <S-Tab> gT
    nnoremap tn :tabnew<CR>

  " Autocomplete - MuComplete
    set completeopt+=menuone
    inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
    inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
    inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
    set completeopt+=noselect
    set completeopt+=noinsert
    set shortmess+=c   " Shut off completion messages
    set belloff+=ctrlg " If Vim beeps during completion
    let g:mucomplete#enable_auto_at_startup = 1

" Language configuration
  " Javascript
  hi link javaScriptTemplateDelim String
  hi link javaScriptTemplateVar Text
  hi link javaScriptTemplateString String

  " Use JSX for all JS
  let g:jsx_ext_required = 0

  " Enable flow
  let g:flow#enable=1

  " Hack autocomplete
  let g:hack#omnifunc=1
  autocmd BufNewFile,BufRead *.php setl omnifunc=hackcomplete#Complete

  " Always format reason
  autocmd BufWritePre *.re :ReasonPrettyPrint

  " CSS sort
    :command! SortCSSBraceContents :g#\({\n\)\@<=#.,/}/sort
    :nmap <F10> :SortCSSBraceContents
    " http://stackoverflow.com/questions/3050797/how-to-alphabetize-a-css-file-in-vim/3051140

" Post-hooks (vary by environment)
  if filereadable('~/.vimrc-post')
    source '~/.vimrc-post'
  endif

set modelines=1
" vim:foldmethod=indent:foldlevel=0
