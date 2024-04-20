return {
  "David-Kunz/gen.nvim",
  lazy = false,
  opts = {
    -- model = "mistral:7b-instruct-q4_K_M",
    model = "llama3:8b-instruct-q4_0",
    host = "localhost",
    port = "11434",
    quit_map = "q",
    retry_map = "<c-r>",
    -- init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
    command = function(options)
      local body = { model = options.model, stream = true }
      return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
    end,
    display_mode = "float",
    show_prompt = true,
    show_model = true,
    no_auto_close = false,
    debug = false,
  },

  config = function(_, opts)
    local gen = require "gen"
    gen.prompts["Enhance_Wording_Custom"] = {
      replace = true,
      prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it. The answer should be written in the same language as the input text:\n$text",
    }
    gen.prompts["Enhance_Grammar_Spelling_Custom"] = {
      replace = true,
      prompt = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it. The answer should be written in the same language as the input text:\n$text",
      -- prompt = "Revise the following text to correct only objective grammar, spelling, context errors and missing/incorrect word errors that change the intended meaning. Pay extremely close attention to context to catch missing words or incorrect word choices. Do not suggest stylistic improvements or changes in tone/formality. Only fix factual errors that objectively change the intended meaning. Do not modify anything besides factual errors. Do not change proper nouns, abbreviations, style, tone or formality.The answer should be written in the same language as the input text.\n\nCorrected Text:\n[Provide corrected text with only objective errors fixed here]\n\nOriginal Text:\n$text",
    }
    gen.prompts["List_Enhance_Text_Custom"] = {
      replace = false,
      prompt = "Wie kann der folgende Text verbessert werden? Liste Verbesserungen mit konkreten aber kurzen Beispiel auf. Achte darauf dass deine Vorschläge und Antworten in der selben Sprache wie der Text sind:\n$text ",
    }
    gen.setup(opts)
  end,
}
