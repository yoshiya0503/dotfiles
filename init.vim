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
" Plug 'dense-analysis/ale' " syntax check
Plug 'editorconfig/editorconfig-vim' " editor config
Plug 'honza/vim-snippets' " vim snippets
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua' " filer
Plug 'lukas-reineke/indent-blankline.nvim' " show indent
Plug 'majutsushi/tagbar'   " tagbar
Plug 'thinca/vim-quickrun' " quick run
Plug 'nvim-lualine/lualine.nvim'
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
Plug 'ayu-theme/ayu-vim' " color_scheme
Plug 'kaicataldo/material.vim', { 'branch': 'main' } " color_scheme
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
set fillchars+=vert:\.
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
nnoremap tt :<C-u>tabnew<CR>:<C-u>NvimTreeOpen<CR>:<C-u>Tagbar<Cr>
nnoremap tl gt
nnoremap th gT
syntax enable " syntax highlight
set background=dark
set termguicolors
" let g:onedark_termcolors=256
" let g:solarized_termcolors=256
" colorscheme tokyonight
" colorscheme onedark
"let ayucolor="mirage"
" colorscheme ayu
" colorscheme material
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
"---------------------------
" tree sitter config
"---------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc", "tree-sitter-phpdoc" },
  highlight = {
    enable = true,
    disable = {"html", "css"},
  },
  indent = {
    enable = true,
    disable = {"python"},
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
      \, 'coc-prettier'
      \ ]
imap <C-l> <Plug>(coc-snippets-expand)
"---------------------------
" ALE
"---------------------------

"---------------------------
" status line
"---------------------------
lua <<EOF
require('lualine').setup {
  options = {
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      {
        'filename',
        symbols = {
          readonly = '[]'
        }
      }
    },
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_z = {'tabs'}
  }
}
EOF
"---------------------------
" tree
"---------------------------
nnoremap <C-n> :NvimTreeToggle<CR>
lua <<EOF
require'nvim-tree'.setup {
   open_on_setup = true,
   open_on_setup_file = true,
   open_on_tab = true,
   renderer = {
     highlight_opened_files = "all",
   },
   view = {
    width = 20,
    side = "left",
    mappings = {
      list = {
        { key = "v", action = "vsplit" },
        { key = "o", action = "split" },
        { key = "<c-s>", action = "system_open" },
        { key = "u", action = "dir_up" },
        { key = "s", action = "" },
      },
    },
  },
}
EOF
"---------------------------
" indent
"---------------------------
lua <<EOF
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
EOF

"---------------------------
" tagbar
"---------------------------
let g:tagbar_compact = 1 " no help
let g:tagbar_autofocus = 0
let g:tagbar_width = 20 " tagbar width
let g:tagbar_map_togglesort = 'S' " sort
nmap <C-t> :TagbarToggle<CR>
autocmd FileType * nested :call tagbar#autoopen(0) "auto open tagbar
autocmd VimEnter * nested :TagbarOpen
"---------------------------
" pymode
"---------------------------
" let g:pymode = 0
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 120
" let g:pymode_lint_checkers = ['pylint', 'pep8']
"---------------------------
" vim-go
"---------------------------
let g:go_metalinter_command='golangci-lint run'
"---------------------------
" indent
"---------------------------
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx
autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd! FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType typescript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd! FileType typescript.tsx setlocal shiftwidth=4 tabstop=4 softtabstop=4
" autocmd! FileType typescript.tsx setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType javascript.jsx setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2
