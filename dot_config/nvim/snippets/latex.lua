local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
      s(
        { trig = "mk", snippetType = "autosnippet", priority = 2000},
        {
          t("$"),
          i(1),
          t("$"),
        }
      ),
}
