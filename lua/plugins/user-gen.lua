return {
  "David-Kunz/gen.nvim",
  lazy = false,
  opts = {
    model = "mistral:7b-instruct-q4_K_M",
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
      replace = false,
      model = "mixtral:8x7b-instruct-v0.1-q2_K", -- Langsam dafür guter Output
      prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it. The Answer must be in same language as the text:\n$text",
      -- prompt = "Ändere den folgenden Text so, dass er besser formuliert ist, und gib dann den endgültigen Text ohne zusätzliche Anführungszeichen und Erklärung aus. Deine Antworte muss auf Deutsch sein: $text",
      -- model = "zephyr:7b-beta-q5_K_M", -- geschwindigkeit ok, relativ guter output, probleme mit der/die/das
      -- model = "openhermes:v2.5", -- abgesehen von mixtral beste bisher
    }
    gen.prompts["Enhance_Grammar_Spelling_Custom"] = {
      replace = false,
      model = "mixtral:8x7b-instruct-v0.1-q2_K", -- Langsam dafür guter Output
      -- prompt = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it. The Answer must be in same language as the text:\n$text",

      -- prompt = "Revise the following text to correct only objective grammar, spelling, and context errors that change the intended meaning. Do not suggest stylistic improvements or changes in tone/formality. Pay very close attention to the original style, meaning, and formality to avoid altering them. Only fix factual errors like incorrect word usage, typos, or missing words that objectively change the intended meaning. Do not modify anything besides factual errors. Do not change proper nouns, abbreviations, style, tone or formality.\n\nCorrected Text:\n[Provide corrected text with only objective errors fixed here]\n\nOriginal Text:\n$text",
      prompt = "Revise the following text to correct only objective grammar, spelling, context errors and missing/incorrect word errors that change the intended meaning. Pay extremely close attention to context to catch missing words or incorrect word choices. Do not suggest stylistic improvements or changes in tone/formality. Only fix factual errors that objectively change the intended meaning. Do not modify anything besides factual errors. Do not change proper nouns, abbreviations, style, tone or formality.\n\nCorrected Text:\n[Provide corrected text with only objective errors fixed here]\n\nOriginal Text:\n$text",

      -- model = "openhermes:v2.5", -- abgesehen von mixtral beste bisher
    }
    -- Todo function um verbesserung aufzulisten
    gen.setup(opts)
  end,
}
