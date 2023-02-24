call plug#begin()
	Plug 'https://github.com/tpope/vim-unimpaired.git'
	Plug 'https://github.com/rafi/awesome-vim-colorschemes.git'
	Plug 'https://github.com/prabirshrestha/vim-lsp.git'
call plug#end()

set relativenumber
set ignorecase
set hidden
set backspace=indent,eol,start

set backupdir=~/vimdata/backup//
set directory=~/vimdata/swap//
set undodir=~/vimdata/undo//

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set background=dark
colorscheme 256_noir

if has("gui_running")
	if has("win32")
		runtime gvim.win
	endif
endif
