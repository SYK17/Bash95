return {
    'mfussenegger/nvim-dap-python',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
        require('dap-python').setup('/home/gorlami/python/.venv/bin/python')
    end,
}
