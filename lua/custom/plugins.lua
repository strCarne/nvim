local plugins = {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "rust-analyzer",
                "gopls",
                "golines",
                "gofumpt",
                "goimports-reviser",
                "clangd",
                "clang-format",
                "codelldb",
                "pyright",
                "mypy",
                "ruff",
                "black",
                "debugpy",
                "typescript-language-server",
                "eslint-lsp",
                "prettier",
                "jdtls",
                "lua-language-server",
            }
        },
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function ()
            return require "custom.configs.rust-tools"
        end,
        config = function (_, opts)
           require('rust-tools').setup(opts)
        end,
    },
    { "nvim-neotest/nvim-nio" },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initiliazed["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
            ensure_installed = {
            },
        },
    },
    {
        "mfussenegger/nvim-dap",
        init = function()
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function(_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end,
    },
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end
    },
}
return plugins
