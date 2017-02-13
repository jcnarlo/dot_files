""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager is Vim-Plug: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Utils
" Plug 'airblade/vim-gitgutter' " show git diff in sign column
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finde
Plug 'elzr/vim-json', { 'for': 'json' } " json highlighting
" Plug 'honza/vim-snippets' " snippet files
Plug 'Raimondi/delimitMate' "automatic closing of surrounds
Plug 'scrooloose/nerdtree' " amazing file explorer
" Plug 'sirver/ultisnips' " snippet engine
Plug 'ntpeters/vim-better-whitespace' " whitespace management

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " Golang amazingness

" tpope
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-fugitive' " git tool set
Plug 'tpope/vim-repeat' " allow dot repeat in plugins
Plug 'tpope/vim-surround' " easy modify surrounds

" JavaScript
" Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " indent support
" Plug 'othree/yajs.vim', { 'for': 'javascript' } " syntax plugin
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
" Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support

" Visual aides
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " distraction-free writing
Plug 'fatih/molokai' " color scheme
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " focus tool
Plug 'itchyny/lightline.vim' " status bar
Plug 't9md/vim-choosewin' " window label overlay

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  SETTINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Not vi
set nocompatible

" Enable filetype detection, plugin loading
filetype plugin indent on

" No swap file
set noswapfile

" Search into subfolders; tab-completion for files
set path +=**

" Prefer Unix over Windows over OS 9 formats
set fileformats=unix,dos,mac

" Display matching files when tab complete
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Copy indent from current line
set autoindent

" Add indent based on surrounding code
set smartindent

" Show command when typed
set showcmd

" Set CWD automatically based on current file
autocmd BufEnter * silent! lcd %:p:h

" Change colors
let g:rehash256 = 1
set background=dark
let g:molokai_original = 1
colorscheme molokai

" Auto-reload files changed outside vim
set autoread

" A better backspace
set backspace=indent,eol,start

" Case-insensitive searching
set ignorecase

" Case-sensitive search if upper case letter
set smartcase

" Turn on line numbering
set number

" Set relative line numbering
set relativenumber

" Highlight current line
set cursorline

" Show match while typing
set incsearch

" Highlight found searches
set hlsearch

" Enable mouse
set mouse=a

" Higlhight search
set hls

" Wrap text at word boundary
set wrap
set lbr
set showbreak=&

" Default
set encoding=utf-8

" toggle invisible characters
" set list
set nolist
set listchars=tab:→\ ,eol:¬,trail:°,extends:»,precedes:«

" Split right of current window
set splitright

" Split below of current window
set splitbelow

" Automatic saving
set autowrite

" Hide buffer when abandoned
set hidden

" Save Vim info on exit
set viminfo='200

" Dont show status since it's in lighline
set noshowmode

" Change complete menu behavior
set completeopt=menu,menuone

set lazyredraw

 " No sounds on errors
set noerrorbells
set novisualbell
set t_vb=

set history=500
set nostartofline
set confirm

" avoid many cases of having to press enter to continue
set cmdheight=2

" toggle between 'paste' and 'nopaste'
nnoremap <F12> :set invpaste paste?<CR>
imap <F12> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F12>

" Tab control
set noexpandtab             " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'

set ttyfast                 " faster redrawing
set ttyscroll=3
set scrolloff=3             " lines of text around cursor

set diffopt+=vertical

" Windows
if has("windows")
	set guifont=Consolas:h15:cANSI
	au GUIEnter * simalt ~x
endif

" print path
" map <C-f> :echo expand("%:p")<cr>

" automatic saving and restoring of folds
set viewdir=$HOME/.vim/.vimview//
autocmd BufWrite * mkview
autocmd BufRead * silent loadview

" quick insert character to end of line
imap <F1> <Esc>v`^me<Esc>gi<C-o>:call Ender()<CR>
function! Ender()
  let endchar = nr2char(getchar())
  execute "normal \<End>a".endchar
  normal `e
endfunction

" Allow colors
syntax enable

nnoremap <silent> <Leader>df :call DiffToggle()<CR>

function! DiffToggle()
    if &diff
        windo diffoff
    else
        windo diffthis
    endif
:endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  MAPPINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Example to load your own snippet sans plugin
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>

" Set leader key
let mapleader = ","

" omnicompletion
inoremap <C-@> <C-x><C-o>

" quickfix see next/previous
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" quickfix close
nnoremap <leader>a :cclose<CR>

" Close all but current window
nnoremap <leader>o :only<CR>

" Close current screen
nnoremap <leader>x :clo<CR>

" save and exit
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q<CR>
" nnoremap <silent> <leader>q :q!<CR>

" exit insert mode
" inoremap jj <esc>

" reload and edit vimrc
nnoremap <F5> :source $MYVIMRC<CR>
nnoremap <leader><F5> :edit $MYVIMRC<CR>

" switch tab left and right
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>

" Toggle highlight from searches
nnoremap <leader>/ :set hlsearch!<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Center the screen
nnoremap <space> zz

" Center search on screen
nnoremap n nzzzv
nnoremap N Nzzzv

" Center serch on paragraph move
nnoremap { {zzzv
nnoremap } }zzzv

" Center search on scroll down/up
" noremap <C-d> <C-d>zz
" noremap <C-u> <C-u>zz

" Save and restore session
map <F2> :mksession! ~/vim_session<CR>
map <F3> :source ~/vim_session<CR>

" Toggle spell check
map <leader>S :setlocal spell!<cr>
"
" Remove trailing white space
" nmap <leader>t :%s/\s\+$<cr>
nmap <Leader>t :StripWhitespace<CR>

" Paste from clipboard Windows
if has("windows")
	nmap <Leader>p <S-Insert>
endif

" Disable arrow keys, up/down moves line
no <down> ddp
no <up> ddkP
no <left> <Nop>
no <right> <Nop>
ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>
vno <down> <Nop>
vno <up> <Nop>
vno <left> <Nop>
vno <right> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                delimitMate                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 GitGutter                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap ]h :GitGutterNextHunk<CR>
" nmap [h :GitGutterPrevHunk<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Goyo                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>m :Goyo<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 limelight                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Activate limelight in Goyo mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 UltiSnips                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"

" function! g:UltiSnips_Complete()
" 	call UltiSnips#ExpandSnippet()
" 	if g:ulti_expand_res == 0
" 		if pumvisible()
" 			return "\<C-n>"
" 		else
" 			call UltiSnips#JumpForwards()
" 			if g:ulti_jump_forwards_res == 0
" 				return "\<TAB>"
" 			endif
" 		endif
" 	endif
" 	return ""
" endfunction

" function! g:UltiSnips_Reverse()
" 	call UltiSnips#JumpBackwards()
" 	if g:ulti_jump_backwards_res == 0
" 		return "\<C-P>"
" 	endif

" 	return ""
" endfunction


" if !exists("g:UltiSnipsJumpForwardTrigger")
" 	let g:UltiSnipsJumpForwardTrigger = "<tab>"
" endif

" if !exists("g:UltiSnipsJumpBackwardTrigger")
" 	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" endif
" let g:UltiSnipsUsePythonVersion = 3

" au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   CtrlP                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_switch_buffer = 'et'  " jump to a file if it's open already
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt,max:10,results:10'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}
let g:ctrlp_working_path_mode = 'ra'

" nmap <C-b> :CtrlPCurWD<cr>
" imap <C-b> <esc>:CtrlPCurWD<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   vim-go                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show go declarations
" nmap <C-g> :GoDecls<cr>
" imap <C-g> <esc>:<C-u>GoDecls<cr>

" autocmd FileType go nmap <leader>b  <Plug>(go-build)
" autocmd FileType go nmap <leader>r  <Plug>(go-run)
" autocmd FileType go nmap <leader>t  <Plug>(go-test)
" autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" autocmd FileType go nmap <Leader>i <Plug>(go-info)
" autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)
" autocmd FileType go nmap <silent> <Leader>d <Plug>(go-doc)
" autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
" autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
" autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
" autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
" autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
" autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" let g:go_list_type = "quickfix"
" let g:go_fmt_command = "goimports"
" let g:go_snippet_case_type = "camelcase"
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_deadline = "5s"
" let g:go_decls_includes = "func,type"
" let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1
" let g:go_autodetect_gopath = 1
" let g:go_highlight_build_constraints = 1

" " create a go doc comment based on the word under the cursor
" function! s:create_go_doc_comment()
" 	norm "zyiw
" 	execute ":put! z"
" 	execute ":norm I// \<Esc>$"
" endfunction
" nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vim-json                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:vim_json_syntax_conceal = 0
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

" ==================== choosewin ==================

let g:choosewin_overlay_enable = 1
nmap  -  <Plug>(choosewin)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NerdTree                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let g:NERDTreeMouseMode = 2
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowBookmarks=1

" Start NerdTree automatically if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  fugitive                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 lightline                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show status bar
set laststatus=2

let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste'],
	\             [ 'fugitive', 'filename', 'modified', 'ctrlpmark', 'go'] ],
	\   'right': [ [ 'lineinfo' ],
	\              [ 'percent' ],
	\              [ 'fileformat', 'fileencoding', 'filetype' ] ]
	\ },
	\ 'component': {
	\   'go': '%#goStatuslineColor#%{LightLineGo()}',
	\ },
	\ 'component_visible_condition': {
	\ 'go': '(exists("*go#statusline#Show") && ""!=go#statusline#Show())'
	\ },
	\ 'component_function': {
	\   'lineinfo': 'LightLineInfo',
	\   'percent': 'LightLinePercent',
	\   'modified': 'LightLineModified',
	\   'filename': 'LightLineFilename',
	\   'fileformat': 'LightLineFileformat',
	\   'filetype': 'LightLineFiletype',
	\   'fileencoding': 'LightLineFileencoding',
	\   'mode': 'LightLineMode',
	\   'fugitive': 'LightLineFugitive',
	\   'ctrlpmark': 'CtrlPMark',
	\ },
	\ }

function! LightLineModified()
if &filetype == "help"
	return ""
elseif &modified
	return "+"
elseif &modifiable
	return ""
else
	return ""
endif
endfunction

function! LightLineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
	return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
	return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineFugitive()
	return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGo()
	return exists('*go#statusline#Show') ? go#statusline#Show() : ''
endfunction

function! LightLineMode()
	let fname = expand('%:t')
	return fname == 'ControlP' ? 'CtrlP' :
				\ &ft == 'vimfiler' ? 'VimFiler' :
				\ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
	let fname = expand('%:t')
	if mode() == 't'
		return ''
	endif

	return fname == 'ControlP' ? g:lightline.ctrlp_item :
				\ &ft == 'vimfiler' ? vimfiler#get_status_string() :
				\ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
				\ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
	return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! CtrlPMark()
	if expand('%:t') =~ 'ControlP'
		call lightline#link('iR'[g:lightline.ctrlp_regex])
		return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
					\ , g:lightline.ctrlp_next], 0)
	else
		return ''
	endif
endfunction

let g:ctrlp_status_func = {
			\ 'main': 'CtrlPStatusFunc_1',
			\ 'prog': 'CtrlPStatusFunc_2',
			\ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
	let g:lightline.ctrlp_regex = a:regex
	let g:lightline.ctrlp_prev = a:prev
	let g:lightline.ctrlp_item = a:item
	let g:lightline.ctrlp_next = a:next
	return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
	return lightline#statusline(0)
endfunction
