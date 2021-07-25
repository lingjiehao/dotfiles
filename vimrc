let g:mapleader = ","

syntax enable
filetype indent on
set encoding=utf-8
set ts=4
set sw=4
" set et
set nu
set ai
" set relativenumber
set mouse=a
set fdm=marker
set nowrap

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" vim-plug{{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'haya14busa/incsearch.vim'
" Plug 'tpope/vim-sleuth'
" Plug 'kien/ctrlp.vim'
" Plug 'majutsushi/tagbar'
" Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
" Plug 'vim-scripts/taglist.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()"}}}

" Keymap {{{
imap <leader>; <esc>$a;
nmap <leader>; $a;<esc>;

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}
"
" EasyAlign {{{
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" }}}

" Nerdcommenter {{{
" 注释时自动加空格
let g:NERDSpaceDelims=1
" }}}

" Nerdtree {{{
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" }}}

" colorscheme{{{

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme molokai

" 彩虹括号
let g:rainbow_active = 1

"支持透明背景
" hi Normal ctermbg = none

"修改匹配括号的颜色
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

" airline
let g:airline_theme="simple"
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0

"}}}
