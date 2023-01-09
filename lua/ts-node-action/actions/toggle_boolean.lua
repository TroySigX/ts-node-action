local helpers = require("ts-node-action.helpers")

local boolean_pair_default = {
  ["true"] = "false",
  ["false"] = "true",
}

return function(boolean_pair_overried)
  local boolean_pair = vim.tbl_deep_extend("force",
    boolean_pair_default, boolean_pair_overried or {})

  return function(node)
    return boolean_pair[helpers.node_text(node)] or helpers.node_text(node)
  end
end
