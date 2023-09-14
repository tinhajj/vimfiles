call plug#begin()
	Plug 'CreaturePhil/vim-handmade-hero'
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-unimpaired'
	Plug 'mtth/scratch.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'kien/ctrlp.vim'
call plug#end()

" GVIM
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L  " remove left-hand scroll bar

set guifont=Inconsolata:h16
colorscheme handmade-hero
set number
set relativenumber
set hidden

hi clear SignColumn " transparent signcolumn bg

set directory=$HOME/swapfiles

runtime lsp.vim
