local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = require "telescope".extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      initial_mode = "normal",
      mappings = {
        -- your custom insert mode mappings
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
        },
      },
    },
  },
}

telescope.load_extension("file_browser") 

  vim.keymap.set('n', '<C-p>',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)

  vim.keymap.set('n', 'ss', function()
    builtin.live_grep()
  end)

  vim.keymap.set('n','sg',function()
    builtin.git_status({
      initial_mode = "normal",
    })
  end)

  vim.api.nvim_set_keymap("n","<space>h",":Telescope file_browser path=%:p:h select_buffer=true<CR>",{noremap =true})

  