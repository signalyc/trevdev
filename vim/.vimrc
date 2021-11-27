" Vundle
set nocompatible
filetype off
set rtp+=~/trevdev/vim/bundle/vundle/
call vundle#rc()
"filetype plugin indent on
filetype plugin on

	" My Bundles
	Bundle 'airblade/vim-gitgutter'
	Bundle 'digitaltoad/vim-jade'
	Bundle 'editorconfig/editorconfig-vim'
	Bundle 'godlygeek/tabular'
	Bundle 'groenewege/vim-less'
	Bundle 'jnwhiteh/vim-golang'
	Bundle 'kchmck/vim-coffee-script'
	Bundle 'kien/ctrlp.vim'
	Bundle 'Lokaltog/powerline'
	Bundle 'Lokaltog/vim-easymotion'
	Bundle 'mattn/emmet-vim'
	Bundle 'nvie/vim-rst-tables'
	Bundle 'scrooloose/nerdtree'
	Bundle 'scrooloose/syntastic'
	Bundle 'tomtom/tcomment_vim'
	Bundle 'tpope/vim-fugitive'
	Bundle 'vim-scripts/applescript.vim'
	Bundle 'vim-scripts/localvimrc'
	Bundle 'xsbeats/vim-blade'
	Bundle 'vim-scripts/Mark'
	Bundle 'inkarkat/vim-ingo-library'
	Bundle 'fholgado/minibufexpl.vim'
	Bundle 'plasticboy/vim-markdown'
	"Bundle 'altercation/vim-colors-solarized'
	"Bundle 'flazz/vim-colorschemes'
	"Bundle 'nathanaelkane/vim-indent-guides'

	Bundle 'taglist.vim'

" General Settings
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set title
set visualbell
set ignorecase
set hlsearch
set incsearch
set autoread
set nobackup
set nowb
set noswapfile
set number
set relativenumber
set modelines=2
set backspace=indent,eol,start

autocmd BufNewFile,BufEnter .bash_custom  set ft=sh
autocmd BufNewFile,BufEnter *.applescript set ft=applescript
autocmd BufNewFile,BufEnter *.blade.php   set ft=blade
autocmd BufNewFile,BufEnter *.coffee      set ft=coffee
autocmd BufNewFile,BufEnter *.go          set ft=go
autocmd BufNewFile,BufEnter *.jade        set ft=jade
autocmd BufNewFile,BufEnter *.json        set ft=javascript
autocmd BufNewFile,BufEnter *.less        set ft=less
autocmd BufNewFile,BufEnter .slate        set ft=python
autocmd BufNewFile,BufEnter README        set ft=markdown

" Source the .vimrc file after saving it
" autocmd BufWritePost .vimrc source $MYVIMRC

" Make trailing whitespace annoyingly highlighted.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Saved macros
let @t = ':Tabularize /\(=>\|=\)' "For lining up => and =

" Key mappings
	let mapleader = ";"
    map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
    nmap <Leader>w :w<CR>
    nmap <Leader>b :b#<CR>

	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

	" Easily resize windows with just + or - keys
	map + <C-W>+
	map - <C-W>-

	nore ; :
	imap jj <Esc>
	imap kk <Esc>

	map  <F1> <ESC>:wall<CR>
	imap <F1> <ESC>:wall<CR>

	set pastetoggle=<F2>

	nnoremap <F3> :set hlsearch!<CR>

	map  <F4> <ESC>:call ToggleNumbers()<CR>
	imap <F4> <ESC>:call ToggleNumbers()<CR>
	function! ToggleNumbers()
		if &relativenumber == 1
			set norelativenumber
			:GitGutterEnable
		elseif &number == 1
			set nonumber
			:GitGutterDisable
		elseif &number == 0 && $relativenumber == 0
			set relativenumber
			set number
			:GitGutterEnable
		endif
	endfunction

	nnoremap <F6> :call ToggleMouse()<CR>
	function! ToggleMouse()
		if &mouse == 'a'
			set mouse=
			echo "Mouse usage disabled"
		else
			set mouse=a
			echo "Mouse usage enabled"
		endif
	endfunction

" Colors
	" Needed for Solarized colors to work correctly on local Mac
	set background=light
	" colorscheme solarized
	let g:solarized_termcolors=256

	highlight Search ctermfg=White ctermbg=Red
	highlight LineNr ctermfg=10
	" highlight CursorLineNr ctermfg=1

" Plugins
	" Nerd Tree
	"nmap <C-n> :NERDTreeToggle<CR>
    nmap <Leader>fl :NERDTreeToggle<CR>
	let NERDTreeDirArrows=0
	let NERDTreeShowHidden=1
	" Quit nerdtree if it's the last open
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

	" Taglist
	if !executable('exuberant-ctags')
		let loaded_taglist=1 " disable taglist
	endif
	map <F5> <ESC>:TlistToggle<CR>
	imap <F5> <ESC>:TlistToggle<CR>
	let tlist_php_settings = 'php;c:class;f:function'
	let Tlist_Use_Right_Window = 1

	" .lvimrc
	let g:localvimrc_sandbox=0
	let g:localvimrc_ask=0

	" Ctrl P
	set runtimepath^=~/trevdev/vim/bundle/ctrlp.vim
	let g:ctrlp_max_height = 20
	let g:ctrlp_use_caching = 1
	let g:ctrlp_clear_cache_on_exit = 0
	let g:ctrlp_show_hidden = 1
	"nnoremap <c-p> :CtrlP /var/www<cr> "Can be used to override default base dir

	" Powerline
	set laststatus=2
	set encoding=utf-8
	set rtp+=~/trevdev/vim/bundle/powerline/powerline/bindings/vim
	set t_Co=256
	let g:Powerline_symbols = "fancy"

	" Git Gutter
	highlight clear SignColumn
	let g:gitgutter_max_signs = 99999

	" Syntastic
	" disable for angular
	let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
	let g:loaded_syntastic_php_phpcs_checker = 1

    set tags=tags;
    nmap <Leader>ta :set tags+=./tags<CR>
    nmap <Leader>tc :cs add ./cscope.out<CR>

    let g:mwHistAdd = '/@'
    let g:mwAutoLoadMarks = 1
    nmap <Leader>N :MarkClear<CR>
    nmap <Leader>M :marks<CR>
    nmap <Leader>5 :buffers<CR>:buffer<Space>

    nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
    nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
    nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
    nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>

    nnoremap nw <C-W><C-W>
    nnoremap <Leader>lw <C-W>l
    nnoremap <Leader>hw <C-W>h
    nnoremap <Leader>kw <C-W>k
    nnoremap <Leader>jw <C-W>j
