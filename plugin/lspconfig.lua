local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local on_attach = function(client, bufnr)
  -- do not tsserver formatter
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- TODO: Fix auto opening of Quickfix window
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
end

nvim_lsp.tsserver.setup {
  on_attach=on_attach,
}

nvim_lsp.eslint.setup({
  --- format on save eslint server 
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
