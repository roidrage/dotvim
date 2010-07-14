autocmd BufNewFile,BufRead *.liquid set ft=liquid
autocmd BufNewFile,BufRead _layouts/*.html set ft=liquid
autocmd BufNewFile,BufRead *.html,*.xml,*.textile
      \ if getline(1) == '---' | set ft=liquid| endif
autocmd BufNewFile,BufRead *.md,*.markdown
      \ if getline(1) == '---' | set ft=liquid.markdown| endif
