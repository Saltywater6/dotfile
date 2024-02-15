call plug#begin('~/.vimfiles/pluggin')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
set rnu ts=4 sw=4
set cindent
syntax enable
set backspace=indent,eol,start
set guifont=FiraCode
map <C-p> :call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'python'
		:sp
		:term python %<.py
	elseif &filetype == 'cpp'
		exec "!g++ -std=c++17 % -Wall -o %<"
		:sp
		:term time ./%<
	endif
endfunc

set encoding=utf-8
"set ambiwidth=double
set langmenu=zh_CN.UTF-8

"
" airline
"
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_symbols.colnr = ' ℅:'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = ' ␊:'
  let g:airline_symbols.linenr = ' ␤:'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.colnr = ' :'
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ' :'
  let g:airline_symbols.maxlinenr = '☰ '
  let g:airline_symbols.dirty='⚡'

"
" coc
"
let g:coc_global_extensions=['coc-json','coc-vimlsp','coc-clangd','coc-python']
"suggest.noselect"=true
set updatetime=100
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

map <C-n> :NERDTree<CR>
map <C-tab> :bn<CR>
set foldlevelstart=99
set foldmethod=indent
"colorscheme solarized

