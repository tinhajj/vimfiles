let g:lsp_log_verbose = 1
let g:lsp_log_file = expand("~/vim-lsp.log")

if executable('gopls')
	autocmd User lsp_setup call lsp#register_server({
				\ 'name': 'go-lang',
				\ 'cmd': {server_info->['gopls']},
				\ 'allowlist': ['go'],
				\ })
endif

if executable('typescript-language-server')
	autocmd User lsp_setup call lsp#register_server({
				\ 'name': 'typescript',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server', '--stdio']},
				\ 'allowlist': ['javascript', 'typescript'],
				\ })
endif

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=no
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

	let g:lsp_format_sync_timeout = 1000
	autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

	" refer to doc to add more commands
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
