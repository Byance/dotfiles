return {
  "NTBBloodbath/galaxyline.nvim",
  -- some optional icons
  dependencies = {
    {
      "kyazdani42/nvim-web-devicons",
      opt = true
    },
  },
  config = function()
    require("galaxyline.themes.eviline")
  end,
}
