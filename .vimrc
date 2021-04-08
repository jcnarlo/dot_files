""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager is Vim-Plug: https://github.com/junegunn/vim-plug
" To Update (from a windows cmd prompt) call :PlugUpdate
"silent!call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/grep.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nightsense/plumber'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'StanAngeloff/php.vim'
"Plug 'altercation/vim-colors-solarized'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  SETTINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Not vi
set nocompatible

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
" behave xterm
behave mswin

" Change colors
" let g:rehash256 = 1
set background=dark
colorscheme plumber-dark

" Windows
if has("windows")
	set guifont=Consolas:h13:cANSI
	" This opens vim fullscreen
	"au GUIEnter * simalt ~x
endif
" set guifont=Lucida_Console:h11
set guifont=fixedsys:h12

set selectmode=mouse,key
set nobackup
set nowritebackup

" No swap file
set noswapfile

" Auto-reload files changed outside vim
set autoread

" Save Vim info on exit
set viminfo='200

" Save history
set history=500

" Tab control
set noexpandtab             " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'

" jcnii
" Setting shell causes Plug to fail and Grep to work
"set shell=C:/cygwin64/bin/bash
"set shellcmdflag=--login\ -c
set shellxquote=\"
"set grepprg=grep.exe\ -n

" Enable filetype detection, plugin loading
"set filetype=plugin indent on
set filetype=off
set filetype=plugin

" Prefer Unix over Windows over OS 9 formats
set fileformats=unix,dos,mac

" syn region myFold start="{" end="}" transparent fold
syn sync fromstart
" set foldnestmax=1
set foldlevelstart=99
" for python files set foldmethod=indent
" for c files set foldmethod=syntax
set foldmethod=syntax
" automatic saving and restoring of folds
set viewdir=$HOME/.vim/.vimview//

" Causes grep to not work
" autocmd BufWrite * mkview
" autocmd BufRead * silent loadview

set noundofile
" set backupdir=c:\\temp
set backupdir=c:\temp
set backspace=0
" set nowrap nows

" Case-insensitive searching
" set ignorecase
" Case-sensitive search if upper case letter
" set smartcase

" Highlight found searches
set hlsearch
" Show match while typing
set incsearch

" Display matching files when tab complete
set wildmenu
set wildmode=full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" avoid many cases of having to press enter to continue
set cmdheight=2
set formatoptions=croqn

" Copy indent from current line
set autoindent

" Add indent based on surrounding code
" set smartindent
" Allows for > to shift ^#
set nosmartindent

" Show command when typed
set showcmd

set textwidth=120

set ttyfast                 " faster redrawing
set ttyscroll=3
set scrolloff=3             " lines of text around cursor

" Turn on line numbering
set number
" Turn on relative line numbering
" set relativenumber

" winsize 80 60
set lines=50
set columns=120

" Defines if cursor can move past last char in a line
"set virtualedit=onemore
set virtualedit=insert

" Mark line/column with cursor position
" set cursorline
" set cursorcolumn

"let showmarks_include = "A-Z"
let showmarks_include = ""

let calendar_diary = "~/vimfiles/diary"

" perl syntax
let perl_fold = 1

:compiler msvc
" Colors
" set syntax on   " Overrides colors
syntax enable   " Allows colors


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  MAPPINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
unmap <C-f>

" Set leader key
let mapleader = ","

" jcnii
let mapleader = ","
let maplocalleader = "\\"
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
:inoremap jk <esc>
":inoremap <esc> <nop>
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>

" Make , ,  work like the windows keys should (cut, paste, copy)
map <C-x> "*d
map <C-v> "*p
map <C-c> "*y

" Scroll binding
map <S-F2> :window set scrollbind<CR>
map <S-F3> :window set noscrollbind<CR>

" DirDiff
" Diff current buffer with alternate buffer
" let g:DirDiffExcludes = "Debug,Release,tags,*.swp,*.obj,*.sbr,*.ilk,*.suo,*.pdb,*.idb,*.ncb,*.exp,*.lib,*.map,*.exe,*.manifest"
" map <C-D><C-D> :DirDiff
" map <C-D>f :vert diffsplit #<CR>
" map <C-D>u :diffupdate<CR>
" map <C-D>c <C-W><C-W>:close<CR>:se foldcolumn=0<CR>
" map <C-D>j ]c
" map <C-D>k [c
" map <C-D>p \dp
" map <C-D>g \dg
" map <C-D><C-j> ]c
" map <C-D><C-k> [c
" map <C-D><C-p> \dp
" map <C-D><C-g> \dg

" Parse the grep/error output from the <F5> <F6> commands
map <Leader>z :cope<CR>
map <Leader>k :botright cw<CR>:cp<CR>
map <Leader><Leader> :botright cw<CR>:cc<CR>
map <Leader>j :botright cw<CR>:cn<CR>
map <Leader>K :botright cw<CR>:colder<CR>
map <Leader>J :botright cw<CR>:cnewer<CR>
map t <Leader>j
map T <Leader>k

" Replaces tab with 4 spaces
map <Leader>t :%s/\t/    /g<CR>
" Replaces 4 spaces with tab at beginning of a line
" map <Leader>T :%s/    /\t/g<CR>
map <Leader>T :%s/^\(\t*\)    /\1\t/g<CR>

" Strip blanks (strips all whitespace from the end of the line)
map <Leader>s :%s/\s\+$//<CR>

" Shift case statements in switch statement
map <Leader>sw jjVk%k>

" Add { to line below cursor and complentary } below first statement
map <Leader>b o{<Esc>jo}<Esc>

" Add () to return statements.
map <Leader>r 0ewi(<Esc>$i)<Esc>

" Add () to print statements.
map <Leader>p 0ewi(<Esc>$a)<Esc>

" Add // above and below comment
map <Leader>c O<Esc>jo<Esc>

" Show hex to decimal equivalent
map <C-h>h :let @*=<C-R><C-W><CR>:echo @* +0<CR>

" Strip out all #if 0 // jcnii sections.  C and C++
"map <Leader>a k/^#if \d* \/\/\s*jcnii<C-CR>%%mn%V^%d'nddk
"map <Leader>A k/^#if \d* \/\/\s*jcnii<C-CR>mn%d%'ndd
" Comment out all #{ jcnii } sections.  Python
"Comment out top section
map <Leader>a k/^#{\s*jcnii<CR><C-v>l%hkI#<Esc>x
"Un-Comment out top section
map <Leader>A k/^#{\s*jcnii<CR><C-v>l%hkxI#<Esc>
"Comment out bottom section
map <Leader>b k/^#{\s*jcnii<CR>l%h<C-v>ll%hkI#<Esc>xN
"Un-Comment out bottom section
map <Leader>B k/^#{\s*jcnii<CR>l%h<C-v>ll%hkxI#<Esc>N

" Remove top of if else
map <Leader>d /^#if.*jcnii<Esc>0%%mn%V%d'ndd

" Open the filename (selected text) with the default program.  For example as a web address and open a browser.
vnoremap <silent> <C-F5> :<C-U>let old_reg=@"<CR>gvy:silent!!cmd /cstart <C-R><C-R>"<CR><CR>:let @"=old_reg<CR>

" Search for selected text
:vnoremap * y/<C-R>"<CR>
:vnoremap # y?<C-R>"<CR>

" Example to load your own snippet sans plugin
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>

" omnicompletion
inoremap <C-@> <C-x><C-o>

" quickfix see next/previous
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" quickfix close
nnoremap <Leader>a :cclose<CR>

" Close all but current window
nnoremap <Leader>o :only<CR>

" Close current screen
nnoremap <Leader>x :clo<CR>

" reload and edit vimrc
nnoremap <F5> :source $MYVIMRC<CR>
nnoremap <Leader><F5> :edit $MYVIMRC<CR>

" Toggle highlight from searches
nnoremap <Leader>/ :set hlsearch!<CR>

" Remove search highlight
nnoremap <Leader><space> :nohlsearch<CR>

" Remove trailing white space
" nmap <Leader>t :%s/\s\+$<cr>
" nmap <Leader>t :StripWhitespace<CR>

" Paste from clipboard Windows
if has("windows")
	nmap <Leader>p <S-Insert>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Grep.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\grep.exe'
let Egrep_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\egrep.exe'
let Fgrep_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\Fgrep.exe'
let Grep_Find_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\find.exe'
let Grep_Xargs_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\xargs.exe'

let Grep_Default_Filelist = 'src include'
let Grep_Default_Options = '-R'
let Grep_Cygwin_Find = 0
let Grep_Skip_Dirs = 'tmp .svn .git share builds bin __pycache__ python'
let Grep_Skip_Files = 'tags .*.swp *.obj *.bak *.tmp *.exe *.lib *.dll *.a *.so *.pdb *~ *,v s.*'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" vim-json
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vim_json_syntax_conceal = 0
autocmd FileType json setlocal noexpandtab shiftwidth=4 tabstop=4
autocmd FileType json set foldmethod=syntax
autocmd FileType json set conceallevel=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" NerdTree
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
"""""""""""""""""""" python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_recommended_style = 0

" In python.vim
let python_highlight_numbers = 1

" In python3.0.vim
let python_highlight_builtins = 1
let python_highlight_builtin_objs = 1
let python_highlight_builtin_funcs = 1
let python_highlight_exceptions = 1
let python_highlight_string_formatting = 1
let python_highlight_string_format = 1
let python_highlight_string_templates = 1
let python_highlight_indent_errors = 1
let python_highlight_space_errors = 1
let python_highlight_doctests = 1
"comment out, allows '\t ' to not be hightlighted
"let python_highlight_all = 1
let python_slow_sync = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" rainbow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"User Command
":RainbowToggle  --you can use it to toggle this plugin.
":RainbowLoad    --you can use it to load/reload this plugin.

let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

Plug 'itchyny/lightline.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" rainbow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax enable
"set background=dark
""set background=light
"colorscheme solarized
"call togglebg#map("<F6>")
let g:load_doxygen_syntax=1
