local ns = vim.api.nvim_create_namespace('evenoddlines')

vim.api.nvim_set_decoration_provider(ns, {
  on_win = function()
  end,
  on_line = function(_, _, buf, row)
    if row % 10 == 0 then
      vim.api.nvim_buf_set_extmark(buf, ns, row, 0, {
        end_row = row + 1,
        hl_group = 'Visual',
        hl_eol = true,
        ephemeral = true
      })
    end
  end
})




























































