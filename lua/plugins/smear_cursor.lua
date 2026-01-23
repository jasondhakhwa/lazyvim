return {
  "sphamba/smear-cursor.nvim",
  -- opts = {
  --   -- Animation settings
  --   cursor_color = "#cba6f7", -- nice lavender (Catppuccin)
  --   smear_length = 20,        -- trail length (higher = longer)
  --   smear_speed = 0.65,       -- smaller = slower animation
  --   smear_fade = 0.9,         -- opacity falloff (1 = no fade)
  --   smear_min_distance = 2,   -- minimum pixels to move before update

  --   -- Blend mode (makes trail look more natural)
  --   blend = true,
  --   blend_mode = "additive", -- "additive" or "alpha"

  --   -- Optional easing curve (smooth acceleration/deceleration)
  --   easing = "in_out_quad",

  --   -- Whether to hide smear in insert mode
  --   hide_in_insert = true,

  --   -- Enable only in GUI or TUI
  --   enabled = true, -- set false if using slow terminal

  --   -- Disable smear for certain filetypes
  --   exclude_filetypes = { "TelescopePrompt", "lazy" },
  -- },

  opts = {
    -- Trails for buffer/window switching
    smear_between_buffers = true,
    -- Trails for moving between neighboring lines
    smear_between_neighbor_lines = true,
    -- Smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,
    -- Hide the default cursor to avoid flickering
    hide_target_hack = true,
    -- Set the cursor color to 'none'
    cursor_color = "none",
    -- Adjust animation stiffness and damping for a snappier feel
    stiffness = 0.8,
    trailing_stiffness = 0.6,
    damping = 0.95,
    -- Adjust for insert mode
    stiffness_insert_mode = 0.7,
    trailing_stiffness_insert_mode = 0.7,
    damping_insert_mode = 0.95,
    -- Lower value for a more elastic smear
    -- damping = 0.65,
    -- Reduce time interval between frames for smoother animation
    -- time_interval = 7, -- milliseconds
  },


  event = "VeryLazy",
}
