" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Ignores flags for plugin and indent but turns filetype detection off
filetype off

" Setting up vundle package manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'lsdr/monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/html5.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'othree/yajs.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'majutsushi/tagbar'
Plugin 'mxw/vim-jsx'
Plugin 'chriskempson/base16-vim'

" All plugins must be added before this line
call vundle#end()
filetype plugin indent on

" The rest of configuration file goes here

" Allows vim to manage multiple buffers better. Current buffer can
" be put to the background without writing to disk. Undo history is preserved.
set hidden

" Keeps more than the default 20 commands and search patterns
set history=1000

" Extends % matching to match if/elseif/else/end and even open/closing XML tags
runtime macros/matchit.vim

" Better command completion that shows you options rather than just
" going to the first command
set wildmenu
" Makes autocomplete act like shell: only goes up to point of ambiguity while
" still showing all options
set wildmode=list:longest

" These two, when set together make searches containing capital letters
" case sensitive
set ignorecase
set smartcase

" Makes vim set the window's title properly based on the file
" rather than inheriting the terminal's title
set title

" Keeps the cursor and some lines below it in view
set scrolloff=2

" Files changed on the system are automatically reloaded
set autoread

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Always show current position
set ruler

" Height of command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't repeat comment leaders
au FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" In many terminal emulators the mouse works just file, thus enable it
if has('mouse')
  set mouse=a
endif

" Makes search act like most modern browsers (immidiately finds)
set incsearch

" Don't redraw while executing macros (performance)
set lazyredraw

" Turn magic regular expressions on
set magic

" Show matching brackets
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit of extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable

" Enable colorscheme
colorscheme monokai

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai
" Smart indent
set si
" Wrap lines
" set wrap

" Display line numbers
set number

" Use F2 to toggle nerd tree
map <F2> :NERDTreeToggle<CR>

" Use F8 to toggle tagbar
nmap <F8> :TagbarToggle<CR>

" automatically change window's cwd to file's dir
set autochdir

" Powerline setup
set guifont="DejaVu Sans Mono for Powerline"
set laststatus=2

" Tells vim-session plugin to auto save the session
" and auto load it when vim starts
:let g:session_autosave='yes'
:let g:session_autoload='yes'

" Forces vsplit to split to the right instead of the left
set splitright
" Forces split to split below instead of above 
set splitbelow

" vim markdown plugin
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" 2 spaces for JavaScript
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" vim css3 syntax fix for highlighted dashed properties
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType scss setlocal iskeyword+=-
augroup END

" Command for trimming ALL whilespace in a file
function! s:StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

command! Trim call s:StripTrailingWhitespaces()

" Make vim commands appear so you can see which command you're typing
set showcmd

" Make the leader key more convenient
let mapleader=","

" Fuzzy finder keybindings
nmap <Leader>f :FufFileWithCurrentBufferDir<CR>
nmap <Leader>b :FufBuffer<CR>
nmap <Leader>t :FufTaggedFile<CR>
