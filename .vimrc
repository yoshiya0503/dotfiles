"-----------------------------------------------------------------
"neobundle.vim header
"-----------------------------------------------------------------

set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"-----------------------------------------------------------------
"neobundle.vim main module
"-----------------------------------------------------------------
NeoBundle "Shougo/neocomplcache" "code complete
NeoBundle "scrooloose/syntastic" "syntax checker
NeoBundle "Shougo/neosnippet" "code snipets
NeoBundle "honza/vim-snippets" "code snipets
NeoBundle "davidhalter/jedi-vim" 
NeoBundle "Shougo/vimshell.git" "shell of vim
NeoBundle "bling/vim-airline" "airline of status bar
NeoBundle "jelera/vim-javascript-syntax" "javascript syntax
NeoBundle "tomasr/molokai" "color scheme
"-----------------------------------------------------------------
"neobundle.vim hooter
"-----------------------------------------------------------------
filetype plugin indent on     " required!
filetype indent on
syntax on

"-----------------------------------------------------------------
"original vim setting file
"-----------------------------------------------------------------
"show line number
set number
"show title
set title
"show carsole point
set ruler
"show stagus line
set laststatus=2
"no backup
set nowritebackup
"cahnge to normal mode
inoremap <silent> jj <esc>
"colorscheme
colorscheme molokai
"indent tab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
"-----------------------------------------------------------------
"other color 
"-----------------------------------------------------------------
"line color
highlight LineNr ctermfg=226
"status line
set t_Co=256

"-----------------------------------------------------------------
"neocomplecache
"-----------------------------------------------------------------
let g:neocomplcache_enable_at_startup=1 "enable neocomplechace
let g:neocomplcache_smartCase = 1 "smart mode

"Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"-----------------------------------------------------------------
"neosnippet
"-----------------------------------------------------------------
"Plugin key-mappings.
set conceallevel=2 concealcursor=i "enable neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
