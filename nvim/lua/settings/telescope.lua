nnoremap = require('utils').nnoremap

vimp.nnoremap('<leader>p', require('telescope.builtin').find_files)
vimp.nnoremap('<leader>g', require('telescope.builtin').live_grep)
vimp.nnoremap('<leader>b', require('telescope.builtin').buffers)
vimp.nnoremap('<leader>h', require('telescope.builtin').help_tags)
