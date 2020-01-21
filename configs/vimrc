let g:mapleader = ","

" vim-plug{{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'lervag/vimtex'
Plug 'tomasr/molokai'
Plug 'haya14busa/incsearch.vim'
" Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
" Plug 'vim-scripts/taglist.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
call plug#end()"}}}

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:ackprg = 'ag --vimgrep --smart-case'
" 注释时自动加空格
let g:NERDSpaceDelims=1

syntax enable
filetype indent on
set encoding=utf-8
set ts=4
set sw=4
set nu
set ai
set relativenumber 
set mouse=a
set fdm=marker

if has("autocmd")
	  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

imap <leader>; <esc>$a;
nmap <leader>; $a;<esc>;
nmap <leader>sf :Leaderf function<CR>
nmap <leader>si :Leaderf function<CR>
map <F8> :Tagbar<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" colorscheme{{{
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
"支持透明背景
hi Normal ctermbg = none
"修改匹配括号的颜色
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
"""""airline start
let g:airline_theme="simple" 
"这个是安装字体后 必须设置此项" 
"let g:airline_powerline_fonts = 1   
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
"""""airline end
"}}}
