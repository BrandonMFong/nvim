return {
  {
    enable = false,
    'sourcegraph/sg.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,

    -- If you have a recent version of lazy.nvim, you don't need to add this!
    --build = "nvim -l build/init.lua",
    config = function()
      require('sg').setup {
        enable_cody = true,
        event = 'InsertEnter',
        auth_strategy = 'environment-variables',
      }
    end,
  },
}
