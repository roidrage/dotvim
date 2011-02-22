

map <Leader>m <Plug>MakeGreen
let g:rubytest_in_quickfix = 1
let g:erlangHighlightBif = 1
let delimitMate_balance_matchpairs = 1
let g:PreviewBrowsers='open'

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

set ruler                         " Show cursor position.
set relativenumber

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set linebreak
set formatoptions=tq
set wrapmargin=4
set textwidth=120
set cursorline

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
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}\ %{SyntasticStatuslineFlag()}%=%-16(\ %l,%c-%v\ %)%P

set pastetoggle=<F2>

" Color mappings.
colorscheme github
highlight SpellBad term=reverse ctermfg=White ctermbg=Red gui=undercurl guisp=Red

map <leader>t :CommandT<cr>
map <Leader>r <Plug>RubyTestRun " change from <Leader>t to <Leader>\
map <Leader>R <Plug>RubyFileRun " change from <Leader>T to <Leader>]
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>b :FufBuffer<cr>

" Yank to clipboard
map <leader>y "+y

"
" Get rid of awkward Ex-mode
map Q <Esc>

" Ruby's hashrocket
imap <C-l> <space>=><space>

" User return key to make highlighted search results disappear
nnoremap <CR> :nohlsearch<CR>/<BS>

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
au FileType markdown,textile setlocal spell spelllang=en_us

au InsertEnter * hi StatusLine ctermbg=white ctermfg=darkred
au InsertLeave * hi StatusLine ctermbg=white ctermfg=black

" Min height and width for a window, useful for the autocmd that follows
set winwidth=15
set winminwidth=15
set winheight=5
set winminheight=5

" Resize current window automatically to fill the max. available space
" Space is set by the variables above
map <leader>f :call CenterCurrentWindow()<cr>
map <leader>= <c-w>=

function! CenterCurrentWindow()
  resize
  vertical resize
endfunction

let g:rubycomplete_rails = 1

function! GithubLink() range
  let l:giturl = system('git config remote.origin.url')
  let l:prefix = substitute(system('git rev-parse --show-prefix'), "\n", '', '')
  let l:repo = get(split(matchstr(l:giturl, '\w\+\/[_-a-zA-Z0-9]\+\.git'), '\.'), 0)
  let l:url = 'https://github.com/' . l:repo
  let l:branch = get(split(substitute(system('git symbolic-ref HEAD'), "\n", '', '') , '/'), -1)
  let l:filename = l:prefix . @%

  let l:full = join([l:url, 'blob', l:branch, l:filename], '/')

  let @* = l:full . '#L' . a:firstline . '-' . a:lastline
endfunction

noremap <Leader>gh :call GithubLink()<CR>
