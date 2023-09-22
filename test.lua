
vim.api.nvim_set_hl(0, "testred", {fg='#aa0000',bg='#202020'})
vim.api.nvim_set_hl(0, "testgreen", {fg='#00aa00',bg='#202020'})
vim.api.nvim_set_hl(0, "testblue", {fg='#0000aa',bg='#202020'})
-- comment
local namespace1 = vim.api.nvim_create_namespace('testred')

vim.api.nvim_set_decoration_provider(namespace1, {
  on_win = function()
  end,
  on_line = function(_, _, buf, row)
    if row % 2 == 0 then
      vim.api.nvim_buf_set_extmark(buf, namespace1, row, 0, {
        end_row = row + 1,
        hl_group = 'testred',
        hl_eol = true,
        ephemeral = true
      })
    end
  end
})

local namespace2 = vim.api.nvim_create_namespace('testblue')
vim.api.nvim_set_decoration_provider(namespace2, {
  on_win = function()
  end,
  on_line = function(_, _, buf, row)
    if row % 3 == 0 then
      vim.api.nvim_buf_set_extmark(buf, namespace2, row, 0, {
        end_row = row + 1,
        hl_group = 'testblue',
        hl_eol = true,
        ephemeral = true
      })
    end
  end
})

local namespace3 = vim.api.nvim_create_namespace('testgreen')
vim.api.nvim_set_decoration_provider(namespace3, {
  on_win = function()
  end,
  on_line = function(_, _, buf, row)
    if row % 4 == 0 then
      vim.api.nvim_buf_set_extmark(buf, namespace3, row, 0, {
        end_row = row + 1,
        hl_group = 'testgreen',
        hl_eol = true,
        ephemeral = true
      })
    end
  end
})
