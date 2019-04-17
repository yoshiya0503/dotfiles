"---------------------------
" @title nvim/init.vim
" @author Yoshiya Ito
" @version 2.0.0
"---------------------------
"---------------------------
" vim-plug package manager
"---------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/syntastic' " syntax check
Plug 'Shougo/neosnippet.vim' " code snippets
Plug 'Shougo/neosnippet-snippets' " snippets file
Plug 'Shougo/deoplete.nvim' " completion
Plug 'davidhalter/jedi-vim' " python completion
Plug 'NigoroJr/rsense'      " ruby completion
Plug 'scrooloose/nerdtree' " filer
Plug 'majutsushi/tagbar'   " tagbar
Plug 'thinca/vim-quickrun' " quick run
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " nerd color
Plug 'vim-airline/vim-airline'  " status bar
Plug 'octol/vim-cpp-enhanced-highlight' " C++
Plug 'python-mode/python-mode', { 'branch': 'develop' } " python
Plug 'vim-ruby/vim-ruby' " ruby
Plug 'tpope/vim-rails' " rails
Plug 'pangloss/vim-javascript' " javascript indent
Plug 'jelera/vim-javascript-syntax' " javascript syntax
Plug 'othree/html5.vim' " html5
Plug 'hail2u/vim-css3-syntax' " css3
Plug 'mxw/vim-jsx' " JSX
Plug 'StanAngeloff/php.vim' " php
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'elzr/vim-json' " json
Plug 'plasticboy/vim-markdown' " markdown
Plug 'godlygeek/tabular' " table markdown
Plug 'tomasr/molokai' " color scheme
Plug 'ryanoasis/vim-devicons' " icons
Plug 'tpope/vim-fugitive' " git
call plug#end()
"---------------------------
" vim original conf
"---------------------------
set number        " show line number
set title         " show title
set ruler         " show carsole point
set laststatus=2  " show status line
set display=uhex  " show hex
set nowritebackup " no backup
set noswapfile    " no swap
set cindent       " indent
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showmatch
set showcmd
set lazyredraw             " scroll speed up?
set cinoptions+=:0,g0      " c indent setting
set clipboard+=unnamedplus " use clipbord
set hlsearch               " hilight search
autocmd BufWritePre * :%s/\s\+$//ge " remove trailing whitespace
" key remap
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
syntax on " syntax hilight
colorscheme molokai
let g:airline_theme = "dark" " airline color
highlight LineNr ctermfg=190
"---------------------------
" syntastic
"---------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_cpp_compiler = "clang++"
let g:syntastic_cpp_compiler_options = "--std=c++11 --stdlib=libc++"
" use python-mode
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_go_checkers = ['gofmt', 'golint', 'govet']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"---------------------------
"C++ compiler. using clang++ (quickrun)
"---------------------------
let g:quickrun_config = {}
if executable("clang++")
    let g:quickrun_config["cpp/clang++11"] = {
                \ "cmdopt": "--std=c++11 --stdlib=libc++",
                \ "type": "cpp/clang++"
                \ }
    let g:quickrun_config["cpp"] = {"type": "cpp/clang++11"}
endif
"---------------------------
" deoplete and snippet
"---------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#num_processes = 1
"---------------------------
" snippet
"---------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" for snippet_complete marker
if has("conceal")
    set conceallevel=2 concealcursor=i "enable neosnippet
endif
let g:neosnippet#snippets_directory="~/.config/nvim/snippets" "snippet directory
"---------------------------
"airline
"---------------------------
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
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"---------------------------
" nerdtree and devicons
"---------------------------
autocmd VimEnter * NERDTree | wincmd p " auto mode
let NERDTreeMinimalUI = 1     " no help
let g:NERDTreeShowHidden=1    " display hidden file
let g:NERDTreeDirArrows=1     " tree style
let g:NERDTreeShowBookmarks=1 " book marks
let NERDTreeWinSize=20        " tree width
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
"---------------------------
" tagbar
"---------------------------
let g:tagbar_compact = 1 " no help
let g:tagbar_autofocus = 1
let g:tagbar_width = 20 "tagbar width
nmap <F2> :TagbarToggle<CR>
autocmd FileType * nested :call tagbar#autoopen(0) "auto open tagbar
"---------------------------
" C++
"---------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"---------------------------
" js, css, html, ruby
"---------------------------
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
"---------------------------
" golang
"---------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
