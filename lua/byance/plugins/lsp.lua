return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { 'j-hui/fidget.nvim', opts = {} },
    'folke/neodev.nvim',
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    require("mason").setup({
      log_level = vim.log.levels.DEBUG
    })
    local servers = {
      lua_ls = {
        Lua = {
          workspace = {checkThirdParty = false},
          telemetry = { enable = false },
          diagnostics = {
            globals = { "vim" }
          },
        },
        rust_analyzer = {
         cmd = {
            "rustup", "run", "stable", "rust-analyzer",
          },
        },
      },
    }
    vim.diagnostic.config({
      virtual_text = true,
      update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      }
    })
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })
    require('neodev').setup()

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_nvim_lsp.default_capabilities())

    local on_attach = function(_, bufnr)
      local nmap = function (keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end
      -- Setting keymaps for lsp
      nmap("<leader>ws", vim.lsp.buf.workspace_symbol,'[W]orkspace [S]ymbols')
      -- nmap("gD", vim.lsp.buf.declaration)
      nmap("<leader>gd", "<cmd>Telescope lsp_definitions<CR>", '[G]oto [D]efinition')
      nmap("<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", '[G]oto [T]ype Definition')
      nmap("<leader>gi", "<cmd>Telescope lsp_implementations<CR>", '[G]oto [I]mplementation')
      nmap("<leader>gr", "<cmd>Telescope lsp_references<CR>", '[G]oto [R]eferences')
      nmap("<leader>df", vim.diagnostic.open_float)
      nmap("<leader>dl", "<cmd>Telescope diagnostics<cr>")
      nmap("<leader>dj", vim.diagnostic.goto_next)
      nmap("<leader>dk", vim.diagnostic.goto_prev)
      nmap("<leader>r", vim.lsp.buf.rename)
      nmap("<leader>li", vim.cmd.LspInfo)

    end
    mason_lspconfig.setup_handlers {
      function (server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }
  end
}
