return {
	"hrsh7th/nvim-cmp",
	config = function()
		local nvim_cmp = require("cmp")
		local devicons = require("nvim-web-devicons")
		local lspkind = require("lspkind")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		nvim_cmp.setup({
			window = {
				completion = nvim_cmp.config.window.bordered(),
				documentation = nvim_cmp.config.window.bordered(),
			},
			formatting = {
				format = function(entry, vim_item)
					if vim.tbl_contains({ "path" }, entry.source.name) then
						local icon, hl_group = devicons.get_icon(entry:get_completion_item().label)
						if icon then
							vim_item.kind = icon
							vim_item.kind_hl_group = hl_group
							return vim_item
						end
					end
					return lspkind.cmp_format({
						with_text = true,
						mode = "symbol_text",
					})(entry, vim_item)
				end,
			},
			mapping = nvim_cmp.mapping.preset.insert({
				["<C-b>"] = nvim_cmp.mapping.scroll_docs(-4),
				["<C-f>"] = nvim_cmp.mapping.scroll_docs(4),
				["<C-Space>"] = nvim_cmp.mapping.complete(),
				["<C-e>"] = nvim_cmp.mapping.abort(),
				["<CR>"] = nvim_cmp.mapping.confirm({ select = true }),
				["<Tab>"] = nvim_cmp.mapping(function(fallback)
					if nvim_cmp.visible() then
						nvim_cmp.select_next_item()
					elseif has_words_before() then
						nvim_cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = nvim_cmp.mapping(function(fallback)
					if nvim_cmp.visible() then
						nvim_cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = nvim_cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
		})

		nvim_cmp.setup.cmdline({ "/", "?" }, {
			mapping = nvim_cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		nvim_cmp.setup.cmdline(":", {
			mapping = nvim_cmp.mapping.preset.cmdline(),
			sources = nvim_cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		nvim_cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
