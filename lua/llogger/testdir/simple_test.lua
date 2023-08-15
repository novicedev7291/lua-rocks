package.loaded.llogger = nil

local logger = require("llogger").setup { name = "Test" }

logger.error([[
Some long stacktrace line with error...index not found error
error occurred in function blah blah
something like this;
]])

logger.finfo("Some message with value <>", 32)


logger.ferror([[
Some long stacktrace line with error...index not found error
error occurred in function <>
something like this <>
]], "Kuldeep", {
    name = "Test",
    age = 32
})
