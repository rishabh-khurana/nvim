-- Diffview
return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles' },
  keys = {
    {
      '<leader>gd',
      function()
        local git_dir = vim.fn.systemlist('git rev-parse --git-dir 2>/dev/null')[1]
        if git_dir then
          vim.cmd('DiffviewOpen')
        end
      end,
      desc = 'Git diff side by side',
    },
    { '<leader>gD', '<cmd>DiffviewClose<CR>', desc = 'Close diff' },
  },
}
