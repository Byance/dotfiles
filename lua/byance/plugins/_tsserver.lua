local function start_tsserver()
  local root_files = {'package.json', 'tsconfig.json', 'jsonconfig.json'}
  local paths = vim.fs.find(root_files, {stop = vim.env.Home})
  local root_dir = vim.fs.dirname(paths[1])

  if root_dir == nil then
    return
  end

  vim.lsp.start({
    name = 'tsserver',
    cmd = {'typescript-language-server', '--stdio'},
    root_dir  = root_dir,
    init_options = {hostInfo = 'neovim'},
  })
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
  desc = 'Start typescript LSP',
  callback = start_tsserver,
})

vim.diagnostic.config({
  float = {
    border = 'rounded',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
vim.lsp.handlers.hover,
{border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
vim.lsp.handlers.signature_help,
{border = 'rounded'}
)

local fmt_group = vim.api.nvim_create_augroup('autoformat_cmds', {clear = true })

local function setup_autoformat(event)
  local id = vim.tbl_get(event, 'data', 'client-id')
  local client = id and vim.lsp.get_client_by_id(id)
  if client == nil then
    return
  end
  local buf_format = function (e)
    vim.lsp.buf.format({
      bufnr = e.buf,
      async = false,
      timeout_ms = 10000,
    })
  end

  vim.api.nvim_create_autocmd('BufWritePre',{
    buffer = event.buf,
    group = fmt_group,
    desc = 'Format current buffer',
    callback = buf_format,
  })

end

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Setup format on save',
  callback = setup_autoformat,
})

local function sign_define(args)
  vim.fn.sign_define(args.name, {
    texthl = args.name,
    text = args.tex,
    numhl = ''
  })
end

sign_define({ name = 'DiagnosticSignError', text = '✘'})
sign_define({ name = 'DiagnosticSignWarn', text = '▲'})
sign_define({ name = 'DiagnosticSignHint', text = '⚑'})
sign_define({ name = 'DiagnosticSignInfo', text = '»'})

return {}
