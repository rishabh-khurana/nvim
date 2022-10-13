local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local on_attach = function(client, bufnr)
  -- do not tsserver formatter
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- TODO: Fix auto opening of Quickfix window
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
end

nvim_lsp.tsserver.setup {
  on_attach=on_attach,
}
