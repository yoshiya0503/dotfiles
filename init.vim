"---------------------------
" @title nvim/init.vim
" @author Yoshiya Ito
" @version 5.0.0
"---------------------------
"---------------------------
" vim-plug package manager
" TODO outlineが起動できない
"---------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neovim/nvim-lspconfig' " LSP
Plug 'williamboman/mason.nvim' " LSP package manager
Plug 'williamboman/mason-lspconfig.nvim' " LSP config bridge
Plug 'jose-elias-alvarez/null-ls.nvim' " LSP improve
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' } "completion UI
Plug 'simrat39/symbols-outline.nvim' " code outline
Plug 'hrsh7th/nvim-cmp' " completion LSP
Plug 'hrsh7th/cmp-nvim-lsp' " completion LSP source
Plug 'hrsh7th/cmp-buffer' " completion LSP file buffer
Plug 'hrsh7th/cmp-path' " completion LSP file path
Plug 'hrsh7th/cmp-cmdline' " completion LSP vim command
Plug 'onsails/lspkind.nvim' " completion with Icon
Plug 'L3MON4D3/LuaSnip' " code snippet
Plug 'saadparwaiz1/cmp_luasnip' " code snippet to cmp
Plug 'rafamadriz/friendly-snippets' " snippet set
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax hilight
Plug 'kyazdani42/nvim-web-devicons' " icon
Plug 'kyazdani42/nvim-tree.lua' " filer
Plug 'rcarriga/nvim-notify' " notification
Plug 'folke/trouble.nvim' " trouble shooting
Plug 'nvim-lualine/lualine.nvim' " status line
Plug 'lukas-reineke/indent-blankline.nvim' " show indent
Plug 'windwp/nvim-autopairs' " bracket pair
Plug 'windwp/nvim-ts-autotag' " bracket tag
Plug 'michaelb/sniprun', {'do': 'bash install.sh 1 >> /tmp/log 2>&1'} " quick code run
Plug 'norcalli/nvim-colorizer.lua' " color code visibility
Plug 'editorconfig/editorconfig-vim' " editor config
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' } " ts code formatter
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' } " go
Plug 'tpope/vim-fugitive' " git
Plug 'EdenEast/nightfox.nvim' "color_schema
Plug 'joshdick/onedark.vim' " color_scheme
Plug 'rebelot/kanagawa.nvim' " color_scheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tomasr/molokai' " color_scheme
call plug#end()

lua << EOF

-- vim grobal config
vim.o.title = true -- show title
vim.o.number = true -- show number
vim.o.writebackup = false -- nobackup
vim.o.swapfile = false -- noswapfile
vim.o.display = 'uhex'  -- show hex
vim.o.signcolumn = "yes" --signcolumn
vim.o.expandtab = true -- tab to space
vim.o.smarttab = true -- smarttab
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
-- vim.o.tabstop = 2
-- vim.o.softtabstop = 2
-- vim.o.shiftwidth = 2
vim.o.cindent = true      -- c interigent indent
vim.o.autoindent = true   -- autoindent !neovim default
vim.o.smartindent = true  -- smart indent system
vim.o.showmatch = true    -- show ()[]{}match
vim.o.smartcase = true    -- search smart case
vim.wo.wrap = false       -- nowrap
vim.opt.fillchars = {     -- vert sign
  vert = " ",
}

-- remove traling white space
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//ge]],
})

-- key remap
vim.keymap.set('i', 'jj', '<esc>', { silent = true})
vim.keymap.set('n', 's', '<Nop>', { silent = true})
vim.keymap.set('n', 's', '<Nop>', { silent = true})
vim.keymap.set('n', 'ss', ':<C-u>sp<CR>', { silent = true})
vim.keymap.set('n', 'sv', ':<C-u>vs<CR>', { silent = true})
vim.keymap.set('n', 'sq', ':<C-u>q<CR>', { silent = true})
vim.keymap.set('n', 'sj', '<C-w>j', { silent = true})
vim.keymap.set('n', 'sk', '<C-w>k',{ silent = true})
vim.keymap.set('n', 'sl', '<C-w>l', { silent = true})
vim.keymap.set('n', 'sh', '<C-w>h', { silent = true})
vim.keymap.set('n', 'sJ', '<C-w>J', { silent = true})
vim.keymap.set('n', 'sK', '<C-w>K', { silent = true})
vim.keymap.set('n', 'sL', '<C-w>L', { silent = true})
vim.keymap.set('n', 'sH', '<C-w>H', { silent = true})

-- tab keymap
vim.keymap.set('n', 'tt', ':<C-u>tabnew<CR><C-u>NvimTreeOpen<CR>', { silent = true })
vim.keymap.set('n', 'tl', 'gt', { silent = true })
vim.keymap.set('n', 'th', 'gT', { silent = true })

-- color config
vim.o.termguicolors = true
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_lualine_bold = true
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme kanagawa]]
-- vim.cmd[[colorscheme molokai]]
-- vim.cmd[[colorscheme nightfox]]
-- vim.highlight.create('Normal', {ctermbg=0, guifg=0, guibg=0}, false)
-- vim.highlight.create('NormalNC', {ctermbg=0, guifg=0, guibg=0}, false)
vim.highlight.create('LineNr', {ctermbg=0, guifg='lime', guibg=0}, false)
-- vim.highlight.create('VertSplit', {ctermbg=0, guifg='lime', guibg=0}, false)
-- vim.highlight.create('SignColumn', {ctermbg=0, guibg=0}, false)
-- vim.highlight.create('QuickFixLine', {ctermbg=0, guibg=0}, false)

-- Icon/Sign Settings
for type, icon in pairs({Error = " ", Warn = " ", Hint = " ", Info = " "}) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- callback
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- lspsagaのcode outline初回起動
  -- vim.api.nvim_exec("LSoutline", false)
end

-- mason
require('mason').setup({
    automatic_installation = true,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- mason lsp config
require('mason-lspconfig').setup_handlers({function(server_name)
  require('lspconfig')[server_name].setup {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
end })

-- lspsaga config
require 'lspsaga'.init_lsp_saga({
show_outline = {
    auto_enter = false,
    }
})
vim.keymap.set("n", "cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "<C-O>", "<cmd>LSoutlineToggle<CR>" , { silent = true})

-- completion config / comp, luanip, lspkind
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

-- nvim-treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc", "tree-sitter-phpdoc" },
  highlight = {
    enable = true,
    disable = {"html", "css"},
  },
  indent = {
    enable = true,
    -- disable = {"python"},
  },
}

-- nvim-tree config
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { silent = true })
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

-- lualine config
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

-- trouble config
vim.keymap.set("n", "TT", "<cmd>TroubleToggle<CR>", { silent = true })
require("trouble").setup {
    padding = false,
    height = 6,
    icons = true,
    -- auto_open = true, -- automatically open the list when you have diagnostics
    -- auto_close = true, -- automatically close the list when you have no diagnostics
}

-- sniprun config
vim.keymap.set("v", "f", "<Plug>SnipRun<CR>", { silent = true })
require'sniprun'.setup({
    display = {"NvimNotify"},
})
require("notify").setup({
    background_colour =  "#000000",
})

-- utitily config
-- tag, autopair bracket, color code visible, indent visible
require("nvim-autopairs").setup {}
require("nvim-ts-autotag").setup {}
require'colorizer'.setup()
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

-- vim-go and prettier
vim.g['go_metalinter_command'] = 'golangci-lint run'
vim.g['prettier#autoformat'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0
EOF
