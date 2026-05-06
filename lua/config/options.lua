-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.number = true
vim.opt.relativenumber = false

-- Custom function to load environment variables from a .env file
local function load_env()
  -- Get the path to ~/.config/nvim/.env
  local env_file = vim.fn.stdpath("config") .. "/.env"
  local f = io.open(env_file, "r")

  if not f then
    return
  end -- If the file doesn't exist, just silently exit

  for line in f:lines() do
    -- Ignore empty lines and comments (lines starting with #)
    line = line:gsub("^%s+", ""):gsub("%s+$", "")
    if line ~= "" and not line:match("^#") then
      -- Split the line at the first equals sign
      local key, value = line:match("^([^=]+)=(.*)$")
      if key and value then
        key = key:gsub("^%s+", ""):gsub("%s+$", "")
        value = value:gsub("^%s+", ""):gsub("%s+$", "")
        -- Remove quotes around the value if they exist
        value = value:gsub('^"(.*)"$', "%1"):gsub("^'(.*)'$", "%1")
        -- Set the environment variable in Neovim
        vim.env[key] = value
      end
    end
  end
  f:close()
end

-- Run the function
load_env()
