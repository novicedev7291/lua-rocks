---You can copy the code as it is in your configuration.
---
---LAssert let you write simple assertion in lua code with assertion displayed
---as logs in messages in neovim, this module is dependent on LLogger for logging
---purpose.
---
---Usage:
---local lassert = require("lassert")
---lassert.assert(3).equal_to(4)
---lassert.assert(3 == 3).is_true()
---lassert.assert({ name = "Kuldeep" }).equal_to({ name = "Kuldeep" })
local this = {
    logger = require("llogger").setup { name = "lassert" }
}

this.assert = function(actual)
    local ducktype_compare = function(a, e)
        local result = true
        for k, v in pairs(a) do
            local keys = vim.tbl_keys(e)
            result = vim.tbl_contains(keys, k) and (function(a_v, e_v)
                if type(a_v) == type(e_v) then
                    if type(a_v) == "table" then
                        return ducktype_compare(a_v, e_v)
                    else
                        return (a_v == e_v)
                    end
                else
                    return false
                end
            end)(v, e[k])

            if not result then
                return result
            end
        end

        return result
    end

    local msg_tmpl = "Left <> not equal to Right <>"

    local api = {}
    api.equal_to = function(expected)
        if type(actual) ~= type(expected) then
            this.logger.finfo("<> ~= <>", type(actual), type(expected))
            return false
        end

        if type(actual) == "table" and ducktype_compare(actual, expected) then
            this.logger.finfo("<> == <>", actual, expected)
        elseif actual == expected then
            this.logger.finfo("<> == <>", actual, expected)
            return true
        else
            this.logger.fwarn(msg_tmpl, actual, expected)
        end
    end

    api.is_true = function()
        if type(actual) == "boolean" and actual == true then
            this.logger.info("Actual is true")
            return true
        else
            this.logger.warn("Failed: actual is false, expected true")
        end
    end
    return api
end

return this
