"-----------------------------------------------------------------
"@title My nvim/init.vim
"@author Yoshiya Ito
"@version 1.0.0
"-----------------------------------------------------------------

"-----------------------------------------------------------------
"dein.vim header
"-----------------------------------------------------------------
filetype plugin indent off
if 0 | endif
set runtimepath^=/Users/yoshiya/.config/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('/Users/yoshiya/.config/nvim/dein'))
"-----------------------------------------------------------------
"dein module
"-----------------------------------------------------------------
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim') "code complete
call dein#add('Shougo/neosnippet.vim') "code snipets
call dein#add('Shougo/neosnippet-snippets') "snippet file
call dein#add('scrooloose/syntastic') "syntax checker
call dein#add('honza/vim-snippets') "code snipets
call dein#add('davidhalter/jedi-vim') "python complete
call dein#add('thinca/vim-quickrun') "quick run
call dein#add('bling/vim-airline') "statuc bar
call dein#add('scrooloose/nerdtree') "filer
call dein#add('majutsushi/tagbar') "file tag
call dein#add('vim-jp/cpp-vim') "C++
call dein#add('octol/vim-cpp-enhanced-highlight') "C++ enhance
call dein#add('klen/python-mode') "python
call dein#add('vim-ruby/vim-ruby') "ruby
call dein#add('NigoroJr/rsense') "ruby syntax check
call dein#add('tpope/vim-rails') "ruby on rails
call dein#add('jelera/vim-javascript-syntax') "javascript
call dein#add('fatih/vim-go') " go
call dein#add('pangloss/vim-javascript') "javascript
call dein#add('itspriddle/vim-javascript-indent') "javascript indent
call dein#add('jiangmiao/simple-javascript-indenter') "javascript indent
call dein#add('mxw/vim-jsx') "jsx
call dein#add('StanAngeloff/php.vim') "PHP
call dein#add('hail2u/vim-css3-syntax') "css3
call dein#add('othree/html5.vim') "html5
call dein#add('leshill/vim-json') "json
call dein#add('plasticboy/vim-markdown') "markdown
call dein#add('tomasr/molokai') "colorschema
call dein#add('editorconfig/editorconfig-vim') "configfile
call dein#add('ryanoasis/vim-devicons') "icon
call dein#add('tpope/vim-fugitive') "git
call dein#add('kana/vim-submode') "submode
"-----------------------------------------------------------------
"dein hooter
"-----------------------------------------------------------------
call dein#end()
if dein#check_install()
  call dein#install()
endif
filetype indent on
filetype plugin indent on
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
"c indent setting
set cinoptions+=:0,g0
"use clipbord
set clipboard+=unnamedplus
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
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"----------------------------------------------------------------
"java syntax hilight
"----------------------------------------------------------------
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1
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
colorscheme molokai
"airline color
let g:airline_theme = "dark"
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
"deoplete
"-----------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
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
