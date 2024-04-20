---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = { -- vim.opt.<key>
        spell = false, -- sets vim.opt.spell
        wrap = true, -- sets vim.opt.wrap
      },
    },
    mappings = {
      n = {
        ["<Leader>aa"] = { ":Gen<cr>", desc = "Gen" },
        ["<Leader>ag"] = { ":Gen Generate<cr>", desc = "Generate" },
        ["<Leader>ac"] = { ":Gen Chat<cr>", desc = "Chat" },
        ["<Leader>al"] = {
          function() require("gen").select_model() end,
          desc = "List Models",
        },
        ["<Leader>a"] = { desc = "AI" },
      },
      v = {
        ["<Leader>aa"] = { ":Gen<cr>", desc = "Gen" },
        ["<Leader>as"] = { ":Gen Summarize<cr>", desc = "Summarize" },
        ["<Leader>ak"] = { ":Gen Ask<cr>", desc = "Ask" },
        ["<Leader>ac"] = { ":Gen Change<cr>", desc = "Change" },
        ["<Leader>ae"] = { desc = "AI Enhance" },
        ["<Leader>aec"] = { ":Gen Enhance_Code<cr>", desc = "Improve Code" },
        ["<Leader>aew"] = { desc = "AI Enhance Wording" },
        ["<Leader>aewe"] = { ":Gen Enhance_Wording<cr>", desc = "Enhance Wording" },
        ["<Leader>aewg"] = { ":Gen Enhance_Wording_Custom<cr>", desc = "Enhance Wording Custom" },
        ["<Leader>aeg"] = { desc = "AI Enhance Grammar" },
        ["<Leader>aege"] = { ":Gen Enhance_Grammar_Spelling<cr>", desc = "Enhance Grammar Spelling" },
        ["<Leader>aegc"] = { ":Gen Enhance_Grammar_Spelling_German<cr>", desc = "Enhance Grammar Spelling Custom" },
        ["<Leader>am"] = { desc = "AI Make" },
        ["<Leader>amc"] = { ":Gen Make_Concise<cr>", desc = "Make Consise" },
        ["<Leader>aml"] = { ":Gen Make_List<cr>", desc = "Make List" },
        ["<Leader>amt"] = { ":Gen Make_Table<cr>", desc = "Make Table" },
        ["<Leader>ame"] = { ":Gen List_Enhance_Text_Custom<cr>", desc = "Make List with Enhancements" },
        ["<Leader>ar"] = { ":Gen Review_Code<cr>", desc = "Review Code" },
        ["<Leader>au"] = { ":Gen Change_Code<cr>", desc = "Change Code" },
        ["<Leader>a"] = { desc = "AI" },
      },
    },
  },
}
