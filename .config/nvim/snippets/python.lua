local ls = require("luasnip")  -- the main luasnip object
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
--
-- local function current_date() 
--   return os.date("%Y-%m-%d")
-- end
--
--
-- ls.add_snippets("python", {
--   s("fed", {
--     t("def "), i(1, "function_name"), t("("), i(2, "args"), t({"):", "    \"\"\""}),
--     t({"", "    "}), i(3, "Short description"), t({"", "", "    Parameters", "    ----------"}),
--     i(4, "args : type"), t({"", "", "    Returns", "    -------"}),
--     i(5, "return_type"), t({"", "    \"\"\""}),
--     t({"", "    "}), i(0)
--   }),
-- })
-- local ls = require("luasnip")
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
--
-- ls.add_snippets("python", {
--     -- NumPy-style def snippet
--     s("def", fmta([[
--         def <name>(<args>) -> <rtype>:
--             """
--             <description>
--
--             Parameters
--             ----------
--             <params>
--
--             Returns
--             -------
--             <returns>
--             """
--             <body>
--     ]], {
--         name = i(1, "function_name"),
--         args = i(2),
--         rtype = i(3, "None"),
--         description = i(4, "Function description"),
--         params = i(5, "param1 : type\n    description"),
--         returns = i(6, "return_type"),
--         body = i(0),
--     }))
-- })
return {
    ls.snippet("python", {
        s("hi", { t("hi!") })
    })
}
