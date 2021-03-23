local nnoremap = function(mapping, command)
  vim.api.nvim_set_keymap('n', mapping, command, { noremap = true })
end

return {
  nnoremap = nnoremap
}
