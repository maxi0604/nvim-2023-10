return { setup = function(config)

  local Rule = require("nvim-autopairs.rule")
  local npairs = require("nvim-autopairs")

  npairs.setup(config)

  local rules_basic = require("nvim-autopairs.rules.basic")
  local quote = rules_basic.quote_creator(npairs.config)
  local bracket = rules_basic.bracket_creator(npairs.config)

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")

			cmp.event:on(
				"confirm_done",
				cmp_autopairs.on_confirm_done()
			)

  local cond = require("nvim-autopairs.conds")
  -- add raw code block for typst
  npairs.add_rules({
    Rule("```", "```", { "typst", "typ", "markdown", "vimwiki", "rmarkdown", "rmd", "pandoc" }),
    Rule("```.*$", "```", { "typst", "typ", "markdown", "vimwiki", "rmarkdown", "rmd", "pandoc" }):only_cr():use_regex(true),
  })
  -- add <> brackets
  npairs.add_rules({
  --  bracket("<",">")
  })
  -- move past commas and semicolons
  for _,punct in pairs { ",", ";" } do
    npairs.add_rules {
      Rule("", punct)
        :with_move(function(opts) return opts.char == punct end)
        :with_pair(function() return false end)
        :with_del(function() return false end)
        :with_cr(function() return false end)
        :use_key(punct)
    }
  end
end
}
