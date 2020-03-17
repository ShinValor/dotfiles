" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

" Leader key
let mapleader=' '

" Source vimrc.plug
if filereadable(expand("~/.vimrc.plug"))
  source ~/.vimrc.plug
endif

" Set compatibility to Vim only.
set nocompatible

" Turn on syntax highlighting
syntax on

" Color Scheme
"colorscheme dracula

" For plug-ins to load correctly.
"filetype plugin indent on

" Vertical bar in insert mode; Block in normal mode
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Show number line
set number relativenumber

" Number line color
highlight LineNr ctermfg=white

" Display options
set showmode
set showcmd

" Spellcheck
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Show Tab and Spaces
set listchars=space:.,tab:>~ list

" Changes the width of the TAB character
set tabstop=2

" Uses space instead of tab
set expandtab

" Number of spaces when tab
set shiftwidth=2

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Highlight color
hi Search cterm=NONE ctermfg=yellow ctermbg=magenta

" Highlight matching parenthesis
set showmatch

" Ignore case when searching
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Even better autoindent (e.g. add indent after '{')
set smartindent

" Copy indent from current line when starting a new line
set autoindent

" Page up and down by 10 lines
set scroll=10

".Display.5.lines.above/below.the.cursor.when.scrolling.with.a.mouse.
set scrolloff=999

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling
set ttyfast

" Treat all numerals as decimal
set nrformats=

" Allow to move around buffer
set hidden

" Window split from right or below
set splitright splitbelow

" Status Bar
"set laststatus=2

" Set status line display
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Automatically wrap text that extends beyond the screen length.
set wrap

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
"set textwidth=80

" Move up and down one line in normal mode
nnoremap j gj
nnoremap k gk

" Move up and down one line in visual mode
vnoremap j gj
vnoremap k gk

" Move up and down one in insert mode
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk

" Shortcutting split navigation, saving a keypress
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Speed up scrolling
set ttyfast

" Encoding
set encoding=UTF-8

" Removes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Enable autocompletion
set wildmode=longest,list,full

" Disable automatically commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
"nnoremap <F2> :set invpaste paste?<CR>
"imap <F2> <C-O>:set invpaste paste?<CR>
"set pastetoggle=<F2>
map <leader>p :set paste!<CR>

" Map the <Space> key to toggle a selected fold opened/closed.
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf

" Automatically save and load folds
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview"

"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

"set guifont=DroidSansMono\ Nerd\ Font:h11
set guifont=FiraCode\ Nerd\ Font:h11

"Source everytime I edit vimrc
autocmd BufWritePost .vimrc source %
