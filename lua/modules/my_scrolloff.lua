local m = {}

local function scroll_to_offset()
  -- 0 means current window
  local win_height = vim.api.nvim_win_get_height(0)
  local win_cursor_line = vim.fn.winline() - 1  -- 0-based
  local win_cursor_line_reversed = win_height - win_cursor_line - 1  -- 0-based
  local offset = math.min(vim.o.scrolloff, math.floor(win_height / 2))
  if win_cursor_line_reversed >= offset then
    return
  end

  -- local win_view = vim.fn.winsaveview()
  local win_cursor_pos = vim.api.nvim_win_get_cursor(0)
  local lines_to_scroll = offset - win_cursor_line_reversed
  -- Apply the updated view
  -- vim.fn.winrestview({ topline = win_view.topline + lines_to_scroll })
  vim.cmd('execute "normal! ' .. lines_to_scroll .. '\\<C-e>"')
  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, win_cursor_pos)
end

m.setup = function(offset)
  vim.opt.scrolloff = offset
  vim.api.nvim_create_autocmd(
    { "CursorMoved", "CursorMovedI", "BufEnter" },
    { pattern = "*", callback = function() scroll_to_offset() end}
  )
end

return m
