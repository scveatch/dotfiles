local ls = require("luasnip")  -- the main luasnip object
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

-- Python function with type hints and docstring
local function gen_args(args)
    local arg_text = args[1][1]
    if arg_text == "" then return sn(nil, t("")) end

    local snippets = {}
    local index = 1
    for arg in string.gmatch(arg_text, "([^,]+)") do
        arg = arg:gsub("^%s+", ""):gsub("%s+$", "")
        table.insert(snippets, sn(nil, { t("        " .. arg .. ": "), i(index, "description") }))
        index = index + 1
    end
    -- join with newlines
    local ret = {}
    for k, v in ipairs(snippets) do
        table.insert(ret, v)
        if k < #snippets then table.insert(ret, t("\n")) end
    end
    return sn(nil, ret)
end

ls.add_snippets("python", {
    s("defdoc", fmt([[
def {func_name}({args}) -> {ret_type}:
    """
    {description}

    Args:
{args_desc}

    Returns:
        {ret_desc}
    """
    {body}
]], {
        func_name = i(1, "my_function"),
        args = i(2, ""),
        ret_type = i(3, "None"),
        description = i(4, "Describe what the function does"),
        args_desc = d(5, gen_args, {2}),
        ret_desc = i(6, "Return value description"),
        body = i(0),
    }))
})
