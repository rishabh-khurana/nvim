-- LSP + Mason
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
          map('K', vim.lsp.buf.hover, 'Hover')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('<leader>e', vim.diagnostic.open_float, 'Open Float')
          map(']d', vim.diagnostic.goto_next, 'Next Diagnostic')
          map('[d', vim.diagnostic.goto_prev, 'Prev Diagnostic')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      vim.diagnostic.config {
        severity_sort = true,
        underline = true,
        signs = false,
        virtual_text = false,
        float = {
          scope = 'cursor',
          border = 'rounded',
          source = true,
          format = function(diagnostic)
            return string.format('%s', diagnostic.message)
          end,
        },
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        pyright = {},
        kotlin_language_server = {},
        ts_ls = {
          format = { enable = false },
          init_options = {
            preferences = {
              importModuleSpecifierPreference = 'relative',
            },
          },
        },
        prettierd = {},
        eslint = {
          enable = true,
          format = { enable = false },
          autoFixOnSave = true,
        },
      }

      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, {
        'stylua',
        'tree-sitter-cli',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
