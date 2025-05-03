-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'farglyNotes',
          path = '~/Projects/Fargly/fNv5',
        },
        -- {
        --   name = 'work',
        --   path = '~/vaults/work',
        -- },
      },

      -- see below for full list of options 👇
    },
    vim.keymap.set('n', '<C-l>', '<C-w>w', { desc = 'Switch Vim Panes' }),
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    cmd = { 'RenderMarkdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    config = function()
      require('obsidian').get_client().opts.ui.enable = false
      vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_get_namespaces()['ObsidianUI'], 0, -1)
      require('render-markdown').setup {}
    end,
  },
  vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true }),
  { 'nvim-tree/nvim-web-devicons', opts = {} },
}
