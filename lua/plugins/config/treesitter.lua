require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true
  },
  query_linter = {
    enable = true
  }
}

require 'treesitter-context'.setup {
  enable = true
}
