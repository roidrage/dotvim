" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.


map <Leader>m <Plug>MakeGreen
let g:rubytest_in_quickfix = 1
let g:LustyJugglerSuppressRubyWarning = 1
let g:erlangHighlightBif = 1

silent! call pathogen#runtime_append_all_bundles()

call pathogen#helptags()

filetype plugin indent on         " Turn on file type detection.
syntax enable                     " Turn on syntax highlighting.
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set linebreak
set formatoptions=tq
set wrapmargin=4
set textwidth=120

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set smarttab
set laststatus=2                  " Show the status line all the time
set autoindent
set smartindent

set shell=/bin/bash               " Some commands seem to have problems with zsh"

set wildignore+=vendor,log,tmp,*.swp
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
" Or use vividchalk
colorscheme github

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
map <leader>T :CommandT<cr>
map <Leader>r <Plug>RubyTestRun " change from <Leader>t to <Leader>\
map <Leader>R <Plug>RubyFileRun " change from <Leader>T to <Leader>]
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
"
" Get rid of awkward Ex-mode
map Q <Esc>

imap <C-l> <space>=><space>

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby set foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

let g:rubycomplete_rails = 1
