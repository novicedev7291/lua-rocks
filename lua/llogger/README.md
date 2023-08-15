## LLogger for logging & tracing message
It helps in generating logging messages with various levels i.e. info, warn, error
etc. You can use it with neovim configurations and plugin code. Currently it 
only supports the console message.

## Dependencies
This module uses some of the neovim provided Apis, so may not work as pure lua
module.

## Features
* Color highlighting of messages i.e. Orange for warn, Red for error.

## Usage
```lua
local log = require("llogger").setup { name = "logger" }
```
### Simple use case
```lua
log.info("Some message")
```
### Variable interpolation
```lua
log.info("Some messgae with variable <>", "value")
log.error([[ Some mult line message
with variable <> ]], "value")
```
**Note:** Variable interpolation placeholder is **<>**

## TODOs
- [  ] File logging support.
- [  ] More test cases for nested log messages.
