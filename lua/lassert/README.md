## LAssert for testing assertion
Simple test assertion using fluent api with messages, which are logged in nvim
messages and below status line in neovim.

### Dependencies
This module has dependency on [LLogger](../llogger/README.md) module.

### Usage
Simple assertions using below:
```lua
local lassert = require("lassert")
lassert.assert(3).equal_to(3);
```
Table assertions:
```lua
lassert.assert({ name = "Kuldeep", age = 32 })
            .equal_to({ name = "Kuldeep", age = 32})
```
Truthy comparision:
```lua
lassert.assert(3 == 3).is_true()
```

### TODOs
- [  ] Negative assertions
- [  ] More test cases
