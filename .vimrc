"-----------------------------------------------------------------
"@title My .vimrc
"@author Yoshiya Ito
"@version 5.0.0
"-----------------------------------------------------------------

"-----------------------------------------------------------------
"neobundle.vim header
"-----------------------------------------------------------------
filetype plugin indent off
if 0 | endif
if &compatible
    set nocompatible               " Be iMproved
endif
set runtimepath^=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
"-----------------------------------------------------------------
"neobundle.vim main module
"-----------------------------------------------------------------
NeoBundleFetch "Shougo/neobundle.vim"
NeoBundle "Shougo/neocomplete" "code complete
NeoBundle "scrooloose/syntastic" "syntax checker
NeoBundle "Shougo/neosnippet" "code snipets
NeoBundle "Shougo/neosnippet-snippets" "snipet file
NeoBundle "honza/vim-snippets" "code snipets
"NeoBundle "davidhalter/jedi-vim"
NeoBundle "Shougo/vimshell.git" "shell of vim
NeoBundle "thinca/vim-quickrun" "quick run
NeoBundle "bling/vim-airline" "airline of status bar
NeoBundle "scrooloose/nerdtree" "nerdtree
NeoBundle "majutsushi/tagbar" "tagbar
"NeoBundle "vim-scripts/java.vim" "java syntax
NeoBundle "vim-jp/cpp-vim" "syntax for c++
NeoBundle "octol/vim-cpp-enhanced-highlight" "syntax for c++ enhance
NeoBundle "klen/python-mode" "python syntax
NeoBundle "vim-ruby/vim-ruby" "ruby syntax
NeoBundle "NigoroJr/rsense"  "ruby syntax improve
NeoBundle "todesking/ruby_hl_lvar.vim" " ruby local syntax
NeoBundle "tpope/vim-rails" "ruby on rails
NeoBundle "fatih/vim-go" " go
NeoBundle "jelera/vim-javascript-syntax" "javascript syntax
NeoBundle "pangloss/vim-javascript" "javascript syntax
NeoBundle "mxw/vim-jsx"
NeoBundle "StanAngeloff/php.vim" "PHP
NeoBundle "itspriddle/vim-javascript-indent" "javascript indent
NeoBundle "jiangmiao/simple-javascript-indenter" "simple javascript indent
NeoBundle "hail2u/vim-css3-syntax" "vim css3 syntax
"NeoBundle "skammer/vim-css-color" "vim css color this plugin is too slow in not using gvim
NeoBundle "othree/html5.vim" "vim html5 syntax
NeoBundle "leshill/vim-json" "json syntax
NeoBundle "digitaltoad/vim-jade" "jade syntax
NeoBundle "wavded/vim-stylus" "stylus syntax
NeoBundle 'plasticboy/vim-markdown' "markdown
NeoBundle 'kannokanno/previm' "preview
NeoBundle 'tyru/open-browser.vim' "open browser
NeoBundle "tomasr/molokai" "color scheme
NeoBundle "altercation/vim-colors-solarized" "color scheme 3
NeoBundle "editorconfig/editorconfig-vim" "config file syntax
"NeoBundle "jmcantrell/vim-virtualenv" "python virtulal env
NeoBundle "ryanoasis/vim-devicons" "icon
NeoBundle "tpope/vim-fugitive" "fugitive
NeoBundle "kana/vim-submode" "submode
"NeoBundleLazy 'jeaye/color_coded', {
            \ 'build': {
            \   'unix': 'cmake . && make && make install',
            \ },
            \ 'autoload': { 'filetypes' : ['c', 'cpp', 'objc', 'objcpp'] },
            \ 'build_commands' : ['cmake', 'make']
            \}

"-----------------------------------------------------------------
"neobundle.vim hooter
"-----------------------------------------------------------------
filetype plugin indent on     " required!
filetype indent on
call neobundle#end()
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
"no swap
set noswapfile
"indent
set cindent
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showmatch
set showcmd
"show hex
set display=uhex
"scroll speed up?
set lazyredraw
set ttyfast
"c indent setting
set cinoptions+=:0,g0
"use clipbord
set clipboard=unnamed,autoselect
"backspace enable for vim 7.4
set bs=start
"encoding
set encoding=utf8
"hilight search
set hlsearch
"remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//ge
"key remap
inoremap <silent> jj <esc>
" panel
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" tab
nnoremap tt :<C-u>tabnew<CR>:<C-u>NERDTree<CR>:<C-u>Tagbar<Cr>
nnoremap tl gt
nnoremap th gT
" panel size
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
"----------------------------------------------------------------
"C++ compiler. using clang++ (syntastick, quickrun)
"----------------------------------------------------------------
if executable("clang++")
    let g:syntastic_cpp_compiler = "clang++"
    let g:syntastic_cpp_compiler_options = "--std=c++11 --stdlib=libc++"
    let g:quickrun_config = {}
    let g:quickrun_config["cpp/clang++11"] = {
                \ "cmdopt": "--std=c++11 --stdlib=libc++",
                \ "type": "cpp/clang++"
                \ }
    let g:quickrun_config["cpp"] = {"type": "cpp/clang++11"}
endif
"----------------------------------------------------------------
"syntastic setting
"----------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ["pep8", "pyflakes"]
let g:syntastic_javascript_checkers = ["jsxhint"]
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_go_checkers = ['go']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"----------------------------------------------------------------
"java syntax hilight
"----------------------------------------------------------------
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1
"----------------------------------------------------------------
"key remap for ()
"----------------------------------------------------------------
"imap {} {}<Left>
"imap [] []<Left>
"imap () ()<Left>
"imap "" ""<Left>
"imap "" ""<Left>
"imap <> <><Left>
"-----------------------------------------------------------------
"high speed cursor in keyRemap4Mac
"-----------------------------------------------------------------
noremap j <down>
noremap k <up>
noremap l <right>
noremap h <left>
"-----------------------------------------------------------------
"color setting
"-----------------------------------------------------------------
"syntax hilight
syntax on
"colorscheme
"colorscheme molokai need for
"http://fixture.jp/blog/2012/08/patch-to-disable-molokai-bgcolor/
colorscheme molokai
set background=dark
let g:molokai_original=1
let g:rehash256 = 1
"airline color
let g:airline_theme = "dark"
"status line
set t_Co=256
"line color
highlight LineNr ctermfg=226
set cursorline
hi clear CursorLine
"-----------------------------------------------------------------
"airline
"-----------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
if !exists("g:airline_symbols")
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ""
let g:airline_symbols.branch = ""
let g:airline_symbols.readonly = ""
let g:airline_symbols.linenr = ""

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"-----------------------------------------------------------------
"neocomplete
"-----------------------------------------------------------------
let g:neocomplete#enable_at_startup=1 "enable neocomplechace
let g:neocomplete#smartCase = 1 "smart mode
let g:neocomplete#sources#syntax#min_keyword_length = 3 "key word length

"Enable omni completion. Not required if they are already set elsewhere in .vimrc
"html omni complete is tooooooooooo heavy....
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal omnifunc=
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au BufRead,BufNewFile *.md set filetype=markdown

if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
else
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"-----------------------------------------------------------------
"neosnippet
"-----------------------------------------------------------------
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" for snippet_complete marker
if has("conceal")
    set conceallevel=2 concealcursor=i "enable neosnippet
endif

"snippet directory
let g:neosnippet#snippets_directory="~/.vim/snippets"
"-----------------------------------------------------------------
"nerdtree
"-----------------------------------------------------------------
"auto mode
autocmd vimenter * NERDTree
"display hidden file
let g:NERDTreeShowHidden=1
"tree style
let g:NERDTreeDirArrows=0
"tree width
let NERDTreeWinSize=20
"-----------------------------------------------------------------
"jedi-vim
"-----------------------------------------------------------------
"jedi is too slow so, comment out this setting
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#popup_on_dot = 1
"let g:jedi#auto_initialization=1
"let g:jedi#popup_select_first=0
"let g:jedi#completions_enabled = 1
"let g:jedi#auto_vim_configuration = 1
"-----------------------------------------------------------------
"jedi and neocomplcache combination
"-----------------------------------------------------------------
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#auto_vim_configuration = 0
"if !exists("g:neocomplete#force_omni_input_patterns")
"    let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.python = "\h\w*\|[^. \t]\.\w*"
"-----------------------------------------------------------------
"pymode
"-----------------------------------------------------------------
"folding method and class
let g:pymode_folding=0
"show document so slow...
let g:pymode_doc=0
"code comletion
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_completion=0
"refactoring tool so slow...
let g:pymode_rope = 0
"virtual env off because of using python3
let g:pymode_virtualenv=0
"code checker
let g:pymode_lint_checkers = ["pep8", "pyflakes"]
"-----------------------------------------------------------------
"tag bar
"-----------------------------------------------------------------
"open tagbar
nmap <F2> :TagbarToggle<CR>
"tagbar width
let g:tagbar_width = 20
"auto open tagbar
"autocmd filetype * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)
"------------------------------------------------------------------
"css and html
"------------------------------------------------------------------
"let g:cssColorVimDoNotMessMyUpdatetime = 1
"------------------------------------------------------------------
"jsx
"------------------------------------------------------------------
let g:jsx_ext_required = 0
"------------------------------------------------------------------
"PHP
"------------------------------------------------------------------
hi def link phpComment Comment
hi def link phpDocTags phpDefine
hi def link phpDocParam phpType
hi def link phpFunctions phpDefine
hi def link phpMethods PreProc
"------------------------------------------------------------------
"Ruby and Ruby on Rails
"------------------------------------------------------------------
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
let g:rsenseUseOmniFunc = 1
"------------------------------------------------------------------
"GO
"------------------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
