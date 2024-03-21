local dap = require('dap')

-- Rust/C/C++
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
