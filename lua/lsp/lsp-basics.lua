-- This file include setting up of lsp server
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
	    "lua_ls",
	    "jdtls",
	    "bashls",
	    "clangd",
	    "cmake",
	    "pyright",
    },
})

local lspconfig = require('lspconfig')

require("mason-lspconfig").setup_handlers({
	function (server_name)
		require("lspconfig")[server_name].setup{}
	end,
})
