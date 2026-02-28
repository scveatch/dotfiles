local ls = require("luasnip")  -- the main luasnip object
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("header", {
    t('"""'),
    t({"", "File: "}), i(1, "filename.py"),
    t({"", "", "Description: "}), i(2, "Brief description of the file"),
    t({"", "", "Author: Spencer Veatch (sveatch@georgefox.edu)"}),
    t({"", "", "Last Modified: "}), i(3, "YYYY-MM-DD"),
    t({"", '"""'}),
  }),
}
