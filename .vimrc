""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " Required for vundle
syntax on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set shell=/bin/bash " Set shell for vundle
call vundle#begin()
Plugin 'gmarik/vundle'

" Silver searcher in ctrl-p
Plugin 'rking/ag.vim'
" Ruby editing niceties (c-x c-o to show methods)
Plugin 'vim-ruby/vim-ruby'
" Rails navigation and much more (:A and :R, also try :Emodel name!)
Plugin 'tpope/vim-rails'
" Git wrapper for vim (try :Gblame)
Plugin 'tpope/vim-fugitive'
" Change surrounding chars (try cs\"' inside braces - remove the \ )
Plugin 'tpope/vim-surround'
" Helper to end control structures automatically (ruby, bash, VS, C/C++ etc)
Plugin 'tpope/vim-endwise'
" Run specs from vim
Plugin 'thoughtbot/vim-rspec'
" Autoclosing of quotes, parentheses, brackets etc
Plugin 'Raimondi/delimitMate'
" Fuzzy search of all files in directory
Plugin 'kien/ctrlp.vim'
" Slim template highlighting
Plugin 'slim-template/vim-slim'
" Begins tab completion with a single <tab> instead of c-x c-o
Plugin 'ervandew/supertab'
" CS syntax, indenting, compling etc
Plugin 'kchmck/vim-coffee-script'
" Easy multi line commenting (try <leader>ci )
Plugin 'ddollar/nerdcommenter'
" Preemptive syntax checking for multiple languages
Plugin 'scrooloose/syntastic'
" Awesome directory listings (try <leader>n )
Plugin 'scrooloose/nerdtree'
" Awesome status line
Plugin 'Lokaltog/vim-powerline'
" Provides nerdtree toggle function (mapped to <leader>n)
Plugin 'jistr/vim-nerdtree-tabs'
" Sublime Text style multiple cursors (put cursor on a word, then hit C-n)
Plugin 'terryma/vim-multiple-cursors'
" Record result of every line of code & replay inline (<leader>m & <leader>r)
Plugin 't9md/vim-ruby-xmpfilter'
" Unobtrusiver highlighting of trailing whitespaces (:Trim)
Plugin 'csexton/trailertrash.vim'
" User defined text-objects
Plugin 'textobj-user'
" Handy ruby block selectors (try var and vir for 'around' and 'inside')
Plugin 'textobj-rubyblock'
" Show marks easily
Plugin 'jacquesbh/vim-showmarks'
" Great collection of colour schemes for vim
Plugin 'flazz/vim-colorschemes'
" Auto ctags update
Plugin 'xolox/vim-easytags'
" Browse ctags in a bar
Plugin 'majutsushi/tagbar'
" Dependency of xolox's vim plugins
Plugin 'xolox/vim-misc'
" Show git diff marks in sidebar
"http://stackoverflow.com/questions/15277241/changing-vim-gutter-color
Plugin 'airblade/vim-gitgutter'
" Align stuff
Plugin 'godlygeek/tabular'
" Send a buffer to tmux
Plugin 'jgdavey/tslime.vim'
" Elixir lang config
Plugin 'elixir-lang/vim-elixir'
" Javascript
Plugin 'jelera/vim-javascript-syntax'
" Ember
Plugin 'https://github.com/joukevandermaas/vim-ember-hbs.git'
" More Ember
Plugin 'dsawardekar/ember.vim'
" Run tests!
Plugin 'janko-m/vim-test'
" Helper for minitest-focus
Plugin 'jcqvisser/focus_toggle'

call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VARIABLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags config
let mapleader=" "
" Set local tags file for increased speed
set tags='./tags'
let g:easytags_dynamic_files=2
" Do not automatically update highlights (slows things down)
let g:easytags_auto_highlight=0
let g:easytags_syntax_keyword = 'always'
let g:easytags_auto_highlight = 0
let g:easytags_auto_update = 0

" Set ctrl-p's maximum height
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 25
" Check syntax on buffer read
let g:syntastic_check_on_open=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_html_checkers=['']
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" Show hidden files in NERDTree
let NERDTreeShowHidden=1
let g:yankring_replace_n_pkey = '<C-;>'

let g:rspec_command = "!rspec --drb {spec}"

" Add change in cursor when in vim in tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REUSEABLE MACROS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change hashrocket (with spaces) to ruby 1.9.x hash syntax
let @s='^f>akbkbkb:Bx'
" Change hashrocket (with no spaces) to ruby 1.9.x hash syntax
let @d='^f>akbkb: Bx'
" Cut a line of text at the first comma found
let @c="^f,al"
" Add a comma to the end of the line
let @a="A,j"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Enable filetype detection, filetype indenting & filetype plugins
filetype plugin indent on
" We want syntax highlighting
syntax on

"""""""""""""""""""""""
" Color Configuration "
"""""""""""""""""""""""
" Enable support for 256 colours
set t_Co=256

" Set background
"set background=light
"set background=dark

" Colour schemes available:
colorscheme Tomorrow-Night

"""""""""""""""""""""""
" End color config    "
"""""""""""""""""""""""

" Set font & size in gui vim (macvim in this case)
if has('gui_running')
  if has('gui_macvim')
    set guifont=Menlo\ Regular:h14
  endif
endif

" Split window appears to the right of current
set splitright
" Split window appears beneath current
set splitbelow
" Enable copying of text using mouse
set mouse=a
" More advanced mouse support (drag etc)
if has('mouse_sgr')
  set ttymouse=sgr
endif

" Line highlighting
set cursorline
" Incremental search as you type
set incsearch
" Highlight current top result of search
set hlsearch
" Clear the initial highlight after sourcing
noh
" Ignore case if search begins with a lowercase letter
set ignorecase
" Enable case sensitive search if search begins with a captial
set smartcase
" Enable line numbers to the left of window
set number
" Offset when scrolling a file larger than window
set scrolloff=5
" Always show the status bar
set laststatus=2
" Do not redraw while running macros
set lazyredraw
" We're running vim not vi!
set nocompatible
" Don't use a temporary swapfile, backup save or write that backup to disk
set noswapfile
set nobackup
set nowritebackup
" Don't line wrap text
set nowrap
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Enable default clipboard to system clipboard
set clipboard=unnamed
" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set notimeout
set ttimeout
set ttimeoutlen=1
" Highlight matching braces
set showmatch
" Hit <tab> to see all available commands
" Try :color <tab> to see what I mean
set wildmenu
" First <tab> complete to longest matching word, next <tab> invokes a list
set wildmode=longest,list
" Wildignore files I don't want to ever open in vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" Source https://github.com/thoughtbot/dotfiles/blob/master/vimrc
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap arrow keys to break the habit
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Shortcuts for tab navigation
nnoremap tl :tabnext<cr>
nnoremap th :tabprev<cr>
nnoremap tn :tabnew<cr>
nnoremap tc :tabclose<cr>

" Removing current search highlight
map <leader>. :noh<cr>
" Paste 0 buffer (last yanked contents)
"nmap <leader>p "0p
" Toggle nerd tree
map <leader>n :NERDTreeTabsToggle<cr>
" Toggle tagbar
map <leader>b :TagbarToggle<cr>
" Close current buffer
map <leader>bd :bd!<cr>
" Close all open buffers
map <leader>ba :1,1000 bd!<cr>

" Tabularize (aligning stuff) mappings
map <leader>: :Tabularize /:\zs<cr>
map <leader>= :Tabularize /=<cr>
map <leader>=> :Tabularize /=>\zs<cr>

" xmpfilter mappings for marking lines & running
map <leader>m <Plug>(xmpfilter-mark)
map <leader>r <Plug>(xmpfilter-run)

" j and k navigate through wrapped lines
nmap k gk
nmap j gj

" Emacs-like beginning and end of line
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Quickly move panes up down left right
map <leader>mh :wincmd H<cr>
map <leader>mj :wincmd J<cr>
map <leader>mk :wincmd K<cr>
map <leader>ml :wincmd L<cr>

" Flip left and right panes
map <leader>mm :NERDTreeTabsClose<cr>:wincmd l<cr>:wincmd H<cr>:NERDTreeTabsOpen<cr>:wincmd l<cr><C-W>=

" vim-rspec mappings
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>r :call RunAllSpecs()<CR>

" Show marks
nnoremap ` :ShowMarksOnce<cr>`

" Clear the search buffer when hitting return
nnoremap <cr> :nohlsearch<cr>

" Toggle between last open buffers
nnoremap <leader><leader> <c-^>

" vim-test shortcuts
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>

" Convenient mappings to complete a shell command
map  <leader>bi :!bundle install<space>
map  <leader>bu :!bundle update<space>
nmap <leader>bx :!bundle exec<space>
nmap <leader>zx :!zeus<space>
" Convenient mappings for vim commands
map <leader>vbi :PluginInstall<cr>
map <leader>vbu :PluginUpdate<cr>
map <leader>vr :so ~/.vimrc<cr>
map <leader>ve :e ~/.vimrc<cr>
map <leader>te :e ~/.tmux.conf<cr>
map <leader>ze :e ~/.zshrc<cr>

" Conventient mapping of :Q to :q for mistakes while trying to quit
command! Q q
command! Qall qall
command! W w
command! Wa wall

" Convenient mappings for CtrlP and ctags
nmap <leader>[ :CtrlPTag<cr>

" Consistent navigation between vim & tmux - this is absolutely awesome
" Source http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
if exists('$TMUX')
  " If 'tmate' is in the $TMUX variable string, we're in tmate, not tmux
  if index(split($TMUX, '\W\+'), "tmux") == -1
    let multiplexer = 'tmate'
  else
    let multiplexer = 'tmux'
  endif

  function! MultiplexerOrSplitSwitch(wincmd, tmuxdir, multiplexer)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system(a:multiplexer . " select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system(multiplexer . " display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <c-h> :call MultiplexerOrSplitSwitch('h', 'L', multiplexer)<cr>
  nnoremap <silent> <c-j> :call MultiplexerOrSplitSwitch('j', 'D', multiplexer)<cr>
  nnoremap <silent> <c-k> :call MultiplexerOrSplitSwitch('k', 'U', multiplexer)<cr>
  nnoremap <silent> <c-l> :call MultiplexerOrSplitSwitch('l', 'R', multiplexer)<cr>
else
  " No tmux session, so navigate panes with <c-hjkl>
  map <c-h> <c-w>h
  map <c-j> <c-w>j
  map <c-k> <c-w>k
  map <c-l> <c-w>l
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCMD
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")

  " Autoindent with two spaces, always expand tabs
  " These are abbreviations for tabstop, shiftwidth, softtabstop
  autocmd BufNewFile,BufReadPost * set ai ts=2 sw=2 sts=2 et

  " Check for external file changes
  autocmd CursorHold,CursorMoved,BufEnter * checktime

  " Close vim if nerdtree is the last window left open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " Source .vimrc when saving .vimrc
  autocmd BufWritePost .vimrc source $MYVIMRC
  " Also load indent files, to automatically do language-dependent indenting.

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " Never wrap slim files
    autocmd FileType slim setlocal textwidth=0

    " Python 4 spaces
    autocmd FileType py set expandtab ts=4 sw=4 ai

    " Remove trailing whitespaces on save
    autocmd BufWritePre * :%s/\s\+$//e

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

  augroup END

  " Manually set syntax to emblem (not sure why it's not picking it up)
  autocmd BufRead,BufNewFile *.embl set syntax=emblem

  " Manually set syntax to slim (not sure why it's not picking it up)
  autocmd BufRead,BufNewFile *.inky set syntax=slim

  " Manually set syntax to javascript (not sure why it's not picking it up)
  autocmd BufRead,BufNewFile *.es6 set syntax=javascript
endif
