"---------------------------
" @title nvim/init.vim
" @author Yoshiya Ito
" @version 4.0.0
"---------------------------
"---------------------------
" vim-plug package manager
"---------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " syntax check and completion files
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " improve syntax
Plug 'editorconfig/editorconfig-vim' " editor config
Plug 'honza/vim-snippets' " vim snippets
Plug 'scrooloose/nerdtree' " filer
Plug 'majutsushi/tagbar'   " tagbar
Plug 'thinca/vim-quickrun' " quick run
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " nerd color
Plug 'vim-airline/vim-airline'  " status bar
Plug 'vim-airline/vim-airline-themes' " status bar theme
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' } " python
Plug 'tpope/vim-rails' " rails
Plug 'NigoroJr/rsense' " ruby completion
Plug 'posva/vim-vue' " Vue
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' } " go
Plug 'plasticboy/vim-markdown' " markdown
Plug 'godlygeek/tabular' " table markdown
Plug 'EdenEast/nightfox.nvim' " color_scheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " color_scheme
Plug 'altercation/vim-colors-solarized' " color_scheme
Plug 'joshdick/onedark.vim' " color_scheme
Plug 'rebelot/kanagawa.nvim' " color_scheme
Plug 'tomasr/molokai' " color_scheme
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
set hlsearch               " highlight search
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
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
syntax enable " syntax highlight
set background=dark
set termguicolors
" let g:onedark_termcolors=256
" let g:solarized_termcolors=256
let g:airline_theme='onedark'
" let g:airline_theme='solarized'
" colorscheme tokyonight
" colorscheme onedark
" colorscheme kanagawa
" colorscheme nightfox
colorscheme molokai
" colorscheme solarized
highlight LineNr guifg=lime guibg=NONE
highlight VertSplit guifg=lime guibg=NONE
highlight QuickFixLine ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight Normal ctermbg=NONE guifg=NONE guibg=NONE
highlight NormalNC ctermbg=NONE guibg=NONE guifg=None
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {"html", "css"},
    }
}
EOF
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
" coc syntax checker and intellisence completion
"---------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = [
      \  'coc-clangd'
      \, 'coc-java'
      \, 'coc-go'
      \, 'coc-pyright'
      \, 'coc-solargraph'
      \, 'coc-tsserver'
      \, 'coc-vetur'
      \, 'coc-json'
      \, 'coc-yaml'
      \, 'coc-html'
      \, 'coc-css'
      \, 'coc-phpls'
      \, 'coc-snippets'
      \, 'coc-tailwindcss'
      \ ]
imap <C-l> <Plug>(coc-snippets-expand)
"---------------------------
"airline
"---------------------------
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_symbols = {}
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
let NERDTreeWinSize=20        " tree width
let g:NERDTreeShowHidden=1    " display hidden file
let g:NERDTreeDirArrows=1     " tree style
let g:NERDTreeShowBookmarks=1 " book marks
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
" pymode
"---------------------------
" let g:pymode = 0
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 120
" let g:pymode_lint_checkers = ['pylint', 'pep8']
"---------------------------
" indent
"---------------------------
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx
autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType typescript.tsx setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType javascript.jsx setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
