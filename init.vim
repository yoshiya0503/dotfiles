"---------------------------
" @title nvim/init.vim
" @author Yoshiya Ito
" @version 2.0.0
"---------------------------
"---------------------------
" vim-plug package manager
"---------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'dense-analysis/ale' " syntax check
Plug 'Shougo/neosnippet.vim' " code snippets
Plug 'Shougo/neosnippet-snippets' " snippets file
Plug 'Shougo/deoplete.nvim' " completion
"Plug 'davidhalter/jedi-vim' " python completion
Plug 'NigoroJr/rsense'      " ruby completion
Plug 'scrooloose/nerdtree' " filer
Plug 'majutsushi/tagbar'   " tagbar
Plug 'thinca/vim-quickrun' " quick run
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " nerd color
Plug 'vim-airline/vim-airline'  " status bar
Plug 'vim-airline/vim-airline-themes' " status bar theme
Plug 'octol/vim-cpp-enhanced-highlight' " C++
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } " python
Plug 'vim-ruby/vim-ruby' " ruby
Plug 'tpope/vim-rails' " rails
Plug 'pangloss/vim-javascript' " javascript indent
Plug 'jelera/vim-javascript-syntax' " javascript syntax
Plug 'othree/html5.vim' " html5
Plug 'hail2u/vim-css3-syntax' " css3
Plug 'mxw/vim-jsx' " JSX
Plug 'posva/vim-vue' " Vue
Plug 'leafgarland/typescript-vim'
Plug 'StanAngeloff/php.vim' " php
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'elzr/vim-json' " json
Plug 'plasticboy/vim-markdown' " markdown
Plug 'godlygeek/tabular' " table markdown
Plug 'altercation/vim-colors-solarized' " color_scheme
Plug 'joshdick/onedark.vim' " color_scheme
Plug 'morhetz/gruvbox' " color_scheme
Plug 'ayu-theme/ayu-vim' " color_scheme
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
" set background=dark
syntax enable " syntax hilight
" colorscheme gruvbox
set termguicolors
" let ayucolor="mirage"
colorscheme onedark
let g:airline_theme='onedark'
" colorscheme solarized
highlight LineNr guifg=lime
"---------------------------
" ALE
"---------------------------
set statusline+=%=
set statusline+=\ %{LinterStatus()}
set statusline+=%#warningmsg#
autocmd FileType python :ALEToggle
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1
let g:ale_lint_on_open = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_fixers = { 'ruby': ['rubocop'] }
"---------------------------
"C++/typescript compiler. using clang++ (quickrun)
"---------------------------
let g:quickrun_config = {}
let g:quickrun_config["cpp"] = {"type": "cpp/clang++11"}
let g:quickrun_config['typescript'] = { 'type' : 'typescript/tsc' }
let g:quickrun_config["cpp/clang++11"] = {
            \ "cmdopt": "--std=c++11 --stdlib=libc++",
            \ "type": "cpp/clang++"
            \ }
let g:quickrun_config['typescript/tsc'] = {
            \   'command': 'tsc',
            \   'exec': ['%c --target esnext --module commonjs %o %s', 'node %s:r.js'],
            \   'tempfile': '%{tempname()}.ts',
            \   'hook/sweep/files': ['%S:p:r.js'],
            \ }
"---------------------------
" deoplete and snippet
"---------------------------
let g:deoplete#enable_at_startup = 1
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
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
"---------------------------
" tagbar
"---------------------------
let g:tagbar_compact = 1 " no help
let g:tagbar_autofocus = 0
let g:tagbar_width = 20 "tagbar width
nmap <F2> :TagbarToggle<CR>
"autocmd FileType * nested :call tagbar#autoopen(0) "auto open tagbar
autocmd VimEnter * nested :TagbarOpen
"---------------------------
" C++
"---------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"---------------------------
" python
"---------------------------
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 120
"---------------------------
" js, ts, vue, css, html, ruby
"---------------------------
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
"---------------------------
" golang
"---------------------------
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
