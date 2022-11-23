local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
if not devicons_ok then
  return
end

local maticons_ok, maticons = pcall(require, "nvim-material-icon")
if not maticons_ok then
  return
end

devicons.setup({
  override = maticons.get_icons(),
})
