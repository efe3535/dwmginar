syntax on

execute pathogen#infect()

let g:loaded_matchparen=1
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
set laststatus=2
set t_Co=256
set mouse=a
nmap <F6> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
set guicursor=
set nu
nnoremap <tab> :tabnext<cr>
" nnoremap <C-w> :q<cr>
nnoremap <C-t> :tabnew<cr>
inoremap <C-space> <Esc>


" lua << EOF
" require("bufferline").setup{}
" EOF

" inoremap <C-tab> <esc>:tabnext<cr>
" inoremap <C-w> <esc>:q<cr>
inoremap <C-t> <esc>:tabnew<cr>

inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
inoremap <C-e> <Esc>GA
nnoremap <C-e> <Esc>GA
" inoremap <C-t> :term<cr> <C-w> <S-k>
" nnoremap <C-t> :term <cr>

set termguicolors
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
" set ttymouse=sgr
set background=dark
let g:gruvbox_contrast_dark="hard"
" let g:airline_theme='Tomorrow-Night-Bright'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:vimdiscord = 1
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
" colorscheme Tomorrow-Night-Bright  
colorscheme gruvbox 
"highlight Normal     ctermbg=NONE guibg=NONE
"highlight LineNr     ctermbg=NONE guibg=NONE
"highlight SignColumn ctermbg=NONE guibg=NONE

set completeopt=menu,menuone,noselect

lua << EOF
  require("flutter-tools").setup{} -- use defaults
EOF

hi Normal guibg=NONE ctermbg=NONE


lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
	  { max_item_count = 7 }
	  -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require'lspconfig'.html.setup{
	capabilities = capabilities
  }

  require('lspconfig')['tsserver'].setup {
     capabilities = capabilities
  }

  require('lspconfig')['clangd'].setup {
     capabilities = capabilities
  }

  require('lspconfig')['gopls'].setup {
     capabilities = capabilities
  }
  
  require('lspconfig')['rust_analyzer'].setup {
  	 capabilities = capabilities
  }
  
  require('lspconfig')['dartls'].setup {
	 capabilities = capabilities
  }
EOF

if has("autocmd")
  au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_UNDERLINE/' ~/.config/xfce4/terminal/terminalrc"
  au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
  au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_UNDERLINE/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"
endif

