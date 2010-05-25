" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=Consolas:h16            " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=light              " Background.
set lines=70 columns=150          " Window dimensions.

set guioptions-=r                 " Don't show right scrollbar

set fuoptions=maxvert,maxhorz
map <leader>f :set fullscreen<CR>
map <leader>F :set nofullscreen<CR>

let g:rubytest_cmd_feature = "cucumber --no-color %p"
let g:rubytest_cmd_story = "cucumber --no-color %p -n '%c'"
