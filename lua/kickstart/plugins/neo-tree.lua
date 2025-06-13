-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- Show hidden files
        hide_gitignored = false, -- Still hide gitignored files
        -- visible = true,       -- Or set this to true if you want them dimmed rather than fully hidden
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    -- ADD THIS 'event_handlers' BLOCK:
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          -- Set absolute line numbers
          vim.cmd 'setlocal number'
          -- OR set relative line numbers
          -- vim.cmd("setlocal relativenumber")
        end,
      },
      {
        event = 'neo_tree_buffer_leave',
        handler = function()
          -- Optionally, unset line numbers when leaving the Neo-tree buffer
          vim.cmd 'setlocal nonumber'
          vim.cmd 'setlocal norelativenumber'
        end,
      },
    },
  },
}
