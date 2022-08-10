"---------------------------
" @title nvim/init.vim
" @author Yoshiya Ito
" @version 5.0.0
"---------------------------
"---------------------------
" vim-plug package manager
" TODO
" 大きいtsファイルに補完が効かない
" Troubleが重い
" perttierが効かない
" sniprunが動かない
"---------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neovim/nvim-lspconfig' " LSP
Plug 'williamboman/nvim-lsp-installer' " LSP installer
Plug 'hrsh7th/nvim-cmp' " completion LSP
Plug 'hrsh7th/cmp-nvim-lsp' " completion LSP source
Plug 'hrsh7th/cmp-buffer' " completion LSP file buffer
Plug 'hrsh7th/cmp-path' " completion LSP file path
Plug 'hrsh7th/cmp-cmdline' " completion LSP vim command
Plug 'onsails/lspkind.nvim' " completion Icon
Plug 'liuchengxu/vista.vim' " ctags outline
Plug 'L3MON4D3/LuaSnip' " code snippet
Plug 'saadparwaiz1/cmp_luasnip' " code snippet to cmp
Plug 'rafamadriz/friendly-snippets' " snippet set
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax hilight
Plug 'kyazdani42/nvim-web-devicons' " icon
Plug 'kyazdani42/nvim-tree.lua' " filer
Plug 'rcarriga/nvim-notify' " notification
Plug 'lukas-reineke/indent-blankline.nvim' " show indent
Plug 'folke/trouble.nvim' " trouble shooting
Plug 'editorconfig/editorconfig-vim' " editor config
Plug 'nvim-lualine/lualine.nvim' " status line
Plug 'michaelb/sniprun', {'do': 'bash install.sh 1 >> /tmp/log 2>&1'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' } " ts code formatter
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' } " go
Plug 'joshdick/onedark.vim' " color_scheme
Plug 'rebelot/kanagawa.nvim' " color_scheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tomasr/molokai' " color_scheme
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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set showmatch
set showcmd
set cinoptions+=:0,g0      " c indent setting
set clipboard+=unnamedplus " use clipbord
set hlsearch               " highlight search
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
"---------------------------
" colorscheme
"---------------------------
lua <<EOF
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent_sidebar = true
EOF
syntax enable " syntax highlight
set background=dark
set termguicolors
" colorscheme tokyonight
" colorscheme kanagawa
colorscheme molokai
highlight LineNr guifg=lime guibg=NONE
highlight VertSplit guifg=lime guibg=NONE
highlight QuickFixLine ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight Normal ctermbg=NONE guifg=NONE guibg=NONE
highlight NormalNC ctermbg=NONE guibg=NONE guifg=None
"---------------------------
" LSP config
"---------------------------
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
lua <<EOF
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require'lspconfig'
local lsp_installer = require "nvim-lsp-installer"
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.setup {
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
EOF
"---------------------------
" completion config
"---------------------------
lua <<EOF
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'
require 'luasnip.loaders.from_vscode'.lazy_load()
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
    })
  }
}
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
EOF
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
" Sniprun
"---------------------------
"---------------------------
" status lualine
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
" tree filter
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
" trouble
"---------------------------
lua << EOF
  require("trouble").setup {
    padding = false,
    height = 6,
    -- auto_open = true, -- automatically open the list when you have diagnostics
    -- auto_close = true, -- automatically close the list when you have no diagnostics
  }
EOF
nnoremap TT <cmd>TroubleToggle<cr>
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
" Sniprun
"---------------------------
lua << EOF
require'sniprun'.setup({
display = {"NvimNotify"},
display_options = {
    notification_timeout = 1
  },
})

require("notify").setup({
  background_colour = "#000000",
})
EOF
vmap f <Plug>SnipRun
"---------------------------
" vista ctags
"---------------------------
let g:vista_default_executive = 'ctags'
let g:vista_stay_on_open = 0
let g:vista_finder_alternative_executives = 'nvim_lsp'
autocmd VimEnter * Vista
"---------------------------
" vim-go
"---------------------------
let g:go_metalinter_command='golangci-lint run'
"---------------------------
" indent
"---------------------------
" autocmd! FileType typescript setlocal shiftwidth=4 tabstop=4 softtabstop=4
" autocmd! FileType typescript.tsx setlocal shiftwidth=4 tabstop=4 softtabstop=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
