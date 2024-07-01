local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

vim.g.rust_recommended_style = false

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
     if (ft == "cc" or ft == "cpp" or ft == "c" or ft == "h" or ft == "hpp") then
      opt.tabstop = 2
      opt.shiftwidth = 2
  end
  end
})
