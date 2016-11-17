"Kyle Merfeld's vimrc

"""""""""""""""""""
"   Plug plugins  "
"""""""""""""""""""


"This pluggin didnt have a git repo, and probably doesn need updates. So i
"just keep it in my dotfiles folder and load it here
:so /home/kyle/.vim/unicodemacros_0.1/unicodemacros.vim

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/csv.vim'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'
Plug 'kablamo/vim-git-log'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wikitopian/hardmode'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'chrisbra/unicode.vim'
Plug 'kien/ctrlp.vim'
"Plug 'floobits/floobits-neovim'
"The following block is for NeoVim plugins or ones that have dependencies 
"that i cannot assume every machine will have
if has ('nvim')
	Plug 'davidhalter/jedi-vim'
	Plug 'zchee/deoplete-jedi'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'blindFS/vim-taskwarrior'
endif
call plug#end()



"""""""""""""""""""
"    Settings	  "
"""""""""""""""""""

"make swap files less anoying
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

filetype plugin indent on
set encoding=utf-8


"bind 'jk' to escape
inoremap jk <ESC>

"this makes number lines apear
set number

"allows folding based on indent
set foldmethod=indent
set foldlevel=99

"Set vim to 256 color mode
set t_Co=256

"set syntax highlighting
syntax enable

"Turns on autoComplete
"set omnifunc=syntaxcomplete#Complete

"Line wrap type stuff
set wrap
set linebreak
set nolist  " list disables linebreak

"sets <leader> to space 
let mapleader = "\<Space>"

" Set show matching parenthesis
set showmatch                       	

" Ignore case when searching
set ignorecase                      	

" Reload the file when it has been chaged outside of vim
set autoread                        	

"Highlight search results
set hlsearch 			   	

"No annoying sound on errors
set noerrorbells 			
set novisualbell

set tm=500

"show when leader is pressed
set showcmd 				

" Return to last edit position when opening files
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif"
" Set 81st column to be highlighted
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"Tabs
" Smart way to move between windows
map <C-j> <C-W>j a
map <C-k> <C-W>k a 
map <C-h> <C-W>h a
map <C-l> <C-W>l a



"""""""""""""""""""
"     plugins     "
"""""""""""""""""""

"vim-hardmode
"enable by default
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
"toggle hardmode with <leader>h
nnoremap <leader>m <Esc>:call ToggleHardMode()<CR>

"vimwiki
let g:vimwiki_folding='expr'
let g:vimwiki_list = [{'path':'$HOME/ownCloud/wiki', 'path_html':'$HOME/ownCloud/wiki/html/'}]


"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']
let g:systastic_rust_checkers = 1

"CSV
"highlight selected column
let g:csv_highlight_column = 'y'
hi CSVColumnEven term=bold ctermbg=4 guibg=DarkBlue
hi CSVColumnOdd  term=bold ctermbg=5 guibg=DarkMagenta



"Rust autoformat
let g:rustfmt_autosave = 1

"rust-racer
set hidden
"let g:racer_cmd ="~/dotiles/vim/plugged/vim-racer"
"let $RUST_SRC_PATH="/usr/share/doc/rust/html/src"



"easymotion
map <Leader> <Plug>(easymotion-prefix)

""nerdtree
map <C-n> :NERDTreeToggle<CR>


"this maps it so i can use multiple 'v's to add to visuall mode
vmap v <Plug>(expand_region_expand)
"vmap <C-v> <Plug>(expand_region_shrink)


"set colorscheme
set background=dark
colorscheme gruvbox

"if has ('nvim')
"	"deoplete.
"	let g:deoplete#enable_at_startup = 1
"		autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
"	autocmd CompleteDone * pclose " To close preview window of deoplete automagically
"endif


"Utilisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""
"	NeoVim		"
"""""""""""""""""""""""""

if has('nvim')
	map <leader>v :vnew<cr>
	map <leader>h :new<cr>
	map <leader>x :bd<cr>
	map <leader>t :terminal<cr>
	tnoremap <Esc> <C-\><C-n>

endif


"https://medium.com/@garoth/neovim-terminal-usecases-tricks-8961e5ac19b9#.ph8fxpnhk
" Window split settings
highlight TermCursor ctermfg=red guifg=red
set splitbelow
set splitright

" Terminal settings
if has('nvim')
	tnoremap <ESC> <C-\><C-n>

	"this is a hack to fix <C-h> in neovim
	"if has('nvim')
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
	" Hack to get C-h working in neovim
	nmap <BS> <C-W>h
	tnoremap <Esc> <C-\><C-n>


	" Window navigation function
	" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
	func! s:mapMoveToWindowInDirection(direction)
		func! s:maybeInsertMode(direction)
			stopinsert
			execute "wincmd" a:direction

			if &buftype == 'terminal'
				startinsert!
			endif
		endfunc

		execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
					\ "<C-\\><C-n>"
					\ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
		execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
					\ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
	endfunc

	for dir in ["h", "j", "l", "k"]
		call s:mapMoveToWindowInDirection(dir)
	endfor
endif

