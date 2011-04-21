" ============================================================================
" File:        rvmprompt.vim
" Description: A simple interface to rvm-prompt command.
"              https://github.com/lucapette/rvm-prompt.vim.
"
" Maintainer:  Luca Pette <lucapette@gmail.com>
" Last Change: 03 April, 2011
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================

if exists("loaded_rvmprompt")
    finish
endif

let loaded_rvmprompt= 1

if !exists("g:rvmprompt_tokens")
    let g:rvmprompt_tokens = ""
endif

function! rvmprompt#statusline()
    if ! exists('g:rvm_prompt')
        let g:rvm_prompt = system("~/.rvm/bin/rvm-prompt"." ".g:rvmprompt_tokens)
        let g:rvm_prompt = substitute(g:rvm_prompt, '\n', '', 'g')
    endif
    return '['.g:rvm_prompt.']'
endfunction
