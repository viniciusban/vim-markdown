" Vim filetype plugin file
" Language:     Markdown
" Maintainer:   viniciusban


" Avoid loading indent file.
"
" Not only for markdown, but for all filetypes. That's how vim works.
"
" I disable loading indent file for markdown because:
"
"   1. vim-polyglot erroneously set configs in indent file;
"   2. Theses configs messes with list formatting;
"   3. "vim-polyglot/after/indent" is loaded after this script.
"
" Thus, the whole process is:
"
"   1. Read the markdown file;
"   2. Run this script (disable ident file);
"   3. Load the markdown file to buffer;
"   4. Re-enable filetype for all filetypes in "BufEnter" event.
filetype indent off
au BufEnter *.md filetype indent on


" =========================
" Let's do something useful
" =========================

setlocal autoindent
" Automatically continue blockquote on line break
setlocal comments+=b:>
setlocal nofoldenable foldmethod=indent
" Indenting in lists and blockquotes with tab
setlocal tabstop=3

" Indenting with >>
setlocal shiftwidth=2

" Numbered lists: a number followed by ":", "." or ")" and a space
setlocal formatlistpat=^\\s*\\d\\+[:.)]\\s*

" Format numbered lists correctly with "gq" and "gw"
setlocal formatoptions=tcqlnr

" Make headings
" -------------
nmap <silent> <buffer> <localleader>1 :let x=substitute(getline("."), "^#* *", "# ", "")<CR>:let x=substitute(x, " *#*$", " #", "")<CR>:call setline(line("."), x)<CR>
nmap <silent> <buffer> <localleader>2 :let x=substitute(getline("."), "^#* *", "## ", "")<CR>:let x=substitute(x, " *#*$", " ##", "")<CR>:call setline(line("."), x)<CR>
nmap <silent> <buffer> <localleader>3 :let x=substitute(getline("."), "^#* *", "### ", "")<CR>:let x=substitute(x, " *#*$", "", "")<CR>:call setline(line("."), x)<CR>
nmap <silent> <buffer> <localleader>4 :let x=substitute(getline("."), "^#* *", "#### ", "")<CR>:let x=substitute(x, " *#*$", "", "")<CR>:call setline(line("."), x)<CR>

" Navigate through headings
" -------------------------

" Next/previous heading (any level)
nmap <silent> <buffer>  ]] :call search("^#\\+ ", "Wzs")<CR>
nmap <silent> <buffer>  [[ :call search("^#\\+ ", "bWzs")<CR>

" Next/previous h2
nmap <silent> <buffer>  ]2 :call search("^## ",   "Wzs")<CR>
nmap <silent> <buffer>  [2 :call search("^## ",   "bWzs")<CR>

" Next/previous h3
nmap <silent> <buffer>  ]3 :call search("^### ",  "Wzs")<CR>
nmap <silent> <buffer>  [3 :call search("^### ",  "bWzs")<CR>