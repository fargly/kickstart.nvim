-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Individual Configuration Items
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.o.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'farglyNotes',
          path = '~/Projects/Fargly/fNv5',
        },
      },
      
      ui = {
        checkboxes = {
          [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          ["x"] = { char = "☑", hl_group = "ObsidianDone" },
        }
      }

      
    },
    config = function(_, opts)
      require('obsidian').setup(opts)
      -- Set encoding to utf-8
      vim.opt.encoding = 'utf-8'
      -- Set conceallevel = 2 only for markdown buffers
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.opt_local.conceallevel = 2
        end,
      })
      -- Keymap for switching panes
      vim.keymap.set('n', '<C-l>', '<C-w>w', { desc = 'Switch Vim Panes', buffer = true })
    end,
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
  { 'nvim-tree/nvim-web-devicons', opts = {} },

--   -- Individual Configuration Items
--   {
--     config = function()
--       vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
--       vim.o.relativenumber = true
--       vim.opt.expandtab = true
--       vim.opt.shiftwidth = 4
--       vim.opt.tabstop = 4
--       vim.opt.softtabstop = 4
--     end,
--   },
} 

