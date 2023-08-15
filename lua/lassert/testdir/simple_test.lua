package.loaded.lassert = nil

local lassert = require("lassert")

lassert.assert(3).equal_to(4)

lassert.assert({ name = "Kuldeep", age = 32 }).equal_to({ age = 32, name = "Kuldeep" })

lassert.assert(2 == 2).is_true()
