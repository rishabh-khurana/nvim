
local status, ts = pcall(require, "nvim-treesitter.configs") -- TODO : support jsx and js syntax highlight
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "json",
    "yaml",
    "css",
    "html",
  },
  filetypes={
    'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'tsx', 'jsx', 'rescript',
    'markdown',
  },
  autotag = {
    enable = true,
  },
}