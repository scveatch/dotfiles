local ls = require("luasnip")  -- the main luasnip object
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

return {
    -- Hello world! 
    -- s(
    --     { trig = "hi", name = "Hello World", dscr = "Prints 'hello world!'" },
    --     fmt("print('hello world!')", {})
    -- ),
    s(
        { trig = "hi", name = "Hello World", dscr = "Prints 'hello world!'" },
        { t("print('hello world!')") }  -- just a text node
    ),

}
