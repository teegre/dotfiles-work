lua << EOB
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "python",
    "twig",
  },
  
  highlight = {
    enable = true,

    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  }
}
EOB
