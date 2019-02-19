""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager is Vim-Plug: https://github.com/junegunn/vim-plug
" To Update (from a windows cmd prompt) call :PlugUpdate
silent!call plug#begin('~/.vim/plugged')

" Utils
" Plug 'airblade/vim-gitgutter' " show git diff in sign column
"jcnii Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finde
"Plug 'elzr/vim-json', { 'for': 'json' } " json highlighting
" Plug 'honza/vim-snippets' " snippet files
" Plug 'Raimondi/delimitMate' " automatic closing of surrounds
Plug 'scrooloose/nerdtree' " amazing file explorer
" Plug 'sirver/ultisnips' " snippet engine
"jcnii Plug 'ntpeters/vim-better-whitespace' " whitespace management
"jcnii Plug 'yegappan/grep' " Grep
Plug 'vim-scripts/grep.vim'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'python.vim'

" Go
"jcnii Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " Golang amazingness

" tpope
"jcnii Plug 'tpope/vim-commentary' " comment stuff out
"jcnii Plug 'tpope/vim-fugitive' " git tool set
"jcnii Plug 'tpope/vim-repeat' " allow dot repeat in plugins
"jcnii Plug 'tpope/vim-surround' " easy modify surrounds

" JavaScript
" Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " indent support
" Plug 'othree/yajs.vim', { 'for': 'javascript' } " syntax plugin
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
" Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript'] } " JSX support

" Visual aides
"jcnii Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " distraction-free writing
Plug 'HenryNewcomer/vim-theme-papaya'
Plug 'fatih/molokai' " color scheme
Plug 'Reewr/vim-monokai-phoenix'  "color scheme
Plug 'crusoexia/vim-monokai'  "color scheme
Plug 'napcs/vim-mycontrast'
Plug 'Heorhiy/VisualStudioDark.vim'
Plug 'vim-scripts/dante.vim'

Plug 'nightsense/plumber'
"Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " focus tool
"Plug 'itchyny/lightline.vim' " status bar
"jcnii Plug 't9md/vim-choosewin' " window label overlay

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
let g:rehash256 = 1
set background=dark
" colorscheme papaya
" let g:molokai_original = 1
" colorscheme molokai
"colorscheme monokai-phoenix
" colorscheme crusoexia/vim-monokai
"let g:monokai_term_italic = 0
"let g:monokai_gui_italic = 0
"colorscheme mycontrast
" colorscheme VisualStudioDark
"colorscheme dante
"
colorscheme plumber-dark

" Windows
if has("windows")
	set guifont=Consolas:h13:cANSI
	" This opens vim fullscreen
	"au GUIEnter * simalt ~x
endif
" set guifont=Lucida_Console:h11
set guifont=fixedsys:h14

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

" Prefer Unix over Windows over OS 9 formats
set fileformats=unix,dos,mac

" syn region myFold start="{" end="}" transparent fold
syn sync fromstart
" set foldnestmax=1
set foldlevelstart=99
" for python files set foldmethod=indent
" set foldmethod=indent
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

" highlight LastSearch ctermbg=lightblue guibg=lightblue
" highlight GrepResult ctermbg=red guibg=red
" Highlight the previous search pattern
" map <C-h> :match LastSearch ///<CR>


" Highlighting line under cursor  :  Still Under investigation
" highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
" nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" Make , ,  work like the windows keys should (cut, paste, copy)
map <C-x> "*d
map <C-v> "*p
map <C-c> "*y

" This mapping is messing up jumping to the tag
" Expand tags when multiple definitions occur
" map <C-]> :tselect "expand("<cword>")"<CR>

" Run the stylechecker on the current file and use its output as error output
" map <C-s> :w!<CR>:silent !c:\Home\ProgramFiles\perl\bin\perl c:\Users\jcnarlo\local\sbin\StyleChecker.pl -e 1 % > c:\Users\jcnarlo\tmp\style.out<CR>:cf c:\Users\jcnarlo\tmp\style.out<CR>:botright cw<CR>
" map <C-s><C-s> :w!<CR>:silent !c:\Home\ProgramFiles\perl\bin\perl c:\Users\jcnarlo\local\sbin\StyleChecker.pl -e 1 -t % > c:\Users\jcnarlo\tmp\style.out<CR>:cf c:\Users\jcnarlo\tmp\style.out<CR>:botright cw<CR>

" Use *.plg in current directory as error output
" map <C-q> :cf *.plg<CR>:botright cw<CR>

" Use buildlog.html file in current directory as error output
" map <C-q>ir    :vi Build\windows\Release\BuildLog.htm<CR><C-q><C-q>
" map <C-q>id    :vi Build\windows\Debug\BuildLog.htm<CR><C-q><C-q>
" map <C-q>icr   :vi Build\windows\ReleaseCSIM\BuildLog.htm<CR><C-q><C-q>
" map <C-q>icd   :vi Build\windows\DebugCSIM\BuildLog.htm<CR><C-q><C-q>
" map <C-q>dd    :vi BuildLog.htm<CR><C-q><C-q>
" map <C-q><C-q> :b BuildLog.htm<CR>:%s/^1>//e<CR>:set fileencoding=<CR>:update<CR>:b#<CR>:cf #<CR>:botright cw<CR>

" F will search for the current function's name and display in the status bar
" Will put this function name into the cut/paste buffer
" TODO: This is not foolproof
"
map F [[k"*yw``:echo @*<CR>

" Scroll binding
map <S-F2> :window set scrollbind<CR>
map <S-F3> :window set noscrollbind<CR>

" Folding, <C-CR> will open a fold,  closes the fold for all functions
" map <C-CR> zA
" map <C-S-CR> za
" map <C-R>  zM

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

" Grep for the current word in the buffer, list of buffers, or current directory
" I don't like the first one, though [I is a neat command
" map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" map <S-F5> :silent grep <cword> %<CR>:botright cope<CR>
" map <S-F6> :silent grep nothing %<CR>:silent bufdo grepadd! <cword> %:botright cope<CR>
" map <S-F7> :silent grep <cword> *.h *.c *.hpp *.cpp *.hxx *.cxx *.pl *.php<CR>:botright cope<CR>
" map <S-F8> :silent grep /s <cword> *.h *.c *.hpp *.cpp *.hxx *.cxx *.pl *.php<CR>:botright cope<CR>

" taglist.vim
" let Tlist_Ctags_Cmd = 'c:\Users\jcnarlo\local\bin\ctags.exe'
" let Tlist_Process_File_Always = 1

" Parse the grep/error output from the <F5> <F6> commands
map <Leader>z :cope<CR>
map <Leader>k :botright cw<CR>:cp<CR>
map <Leader><Leader> :botright cw<CR>:cc<CR>
map <Leader>j :botright cw<CR>:cn<CR>
map <Leader>K :botright cw<CR>:colder<CR>
map <Leader>J :botright cw<CR>:cnewer<CR>
map t <Leader>j
map T <Leader>k
" map t jzoz.
" map T kzoz.

" Open include file under the cursor
"map o :topleft sp <cfile><CR>

" Name completion
" map  <C-space> <Tab>
" map  <C-space> <C-n>
" map! <C-space> <C-n>
" map  <C-S-space> <C-p>
" map! <C-S-space> <C-p>

" Replaces tab with 4 spaces
map <Leader>t :%s/\t/    /g<CR>
" Replaces 4 spaces with tab at beginning of a line
" map <Leader>T :%s/    /\t/g<CR>
map <Leader>T :%s/^\(\t*\)    /\1\t/g<CR>

" Strip blanks (strips all whitespace from the end of the line)
map <Leader>s :%s/\s\+$//g<CR>

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

" save and exit
" nnoremap <Leader>w :w!<cr>
" nnoremap <silent> <Leader>q :q<CR>
" nnoremap <silent> <Leader>q :q!<CR>

" exit insert mode
" inoremap jj <esc>

" reload and edit vimrc
nnoremap <F5> :source $MYVIMRC<CR>
nnoremap <Leader><F5> :edit $MYVIMRC<CR>

" switch tab left and right
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>

" Toggle highlight from searches
nnoremap <Leader>/ :set hlsearch!<CR>

" Remove search highlight
nnoremap <Leader><space> :nohlsearch<CR>

" Center the screen
" nnoremap <space> zz

" Center search on screen
" nnoremap n nzzzv
" nnoremap N Nzzzv

" Center serch on paragraph move
" nnoremap { {zzzv
" nnoremap } }zzzv

" Center search on scroll down/up
" noremap <C-d> <C-d>zz
" noremap <C-u> <C-u>zz

" Save and restore session
map <F2> :mksession! ~/vim_session<CR>
map <F3> :source ~/vim_session<CR>

" Toggle spell check
map <Leader>S :setlocal spell!<cr>
"
" Remove trailing white space
" nmap <Leader>t :%s/\s\+$<cr>
" nmap <Leader>t :StripWhitespace<CR>

" Paste from clipboard Windows
if has("windows")
	nmap <Leader>p <S-Insert>
endif

" Disable arrow keys, up/down moves line
" no <down> ddp
" no <up> ddkP
" no <left> <Nop>
" no <right> <Nop>
" ino <down> <Nop>
" ino <up> <Nop>
" ino <left> <Nop>
" ino <right> <Nop>
" vno <down> <Nop>
" vno <up> <Nop>
" vno <left> <Nop>
" vno <right> <Nop>


" glsl.vim
autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

autocmd BufWritePre *.sh :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.[ch] :%s/\s\+$//e
autocmd BufWritePre *.[ch][p+][p+] :%s/\s\+$//e
autocmd BufWritePre *.txt :%s/\s\+$//e

" Set CWD automatically based on current file
" autocmd BufEnter * silent! lcd %:p:h


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Syntax                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Function gui=bold guifg=Brown
highlight cFunction gui=bold guifg=Black
highlight Tabs guibg=#00ffdf
highlight TabStart guibg=#ffffaf
highlight SpaceStart guibg=#ffff90
highlight SpaceBad guibg=Red
highlight SpaceBadEOL guibg=Red

highlight myDarkRed guifg=#ff0000
highlight myLightRed guifg=#990000
highlight myLightYellow guifg=#999900
highlight myLightGreen guifg=#009900
highlight myLightBlue guifg=#000099
highlight myLightPurple guifg=#990099

syn match cTodo "\<\w\+FIX\>"
"syn match cFunction "\<\w\+\>\([(<]\)\@="
syn match cFunction "\<\w\+\s*\>\([(<]\)\@="
"jcnii syn match SpaceStart "^  *"
syn match SpaceStart "^ \+"
"jcnii syn match Tabs /[^\t]\zs\t\+/
"jcnii syn match TabStart "^\t\t*"
syn match TabStart "^\t\+"
syn match SpaceBad " \t"
syn match SpaceBadEOL "\s\+$"
" syn match Underlined "\<\w\+\>\((\)\@="

match SpaceBad " \t"
match SpaceBadEOL "\s\+$"
" match errorMsg /[^\t]\zs\t\+/

syn match myLightRed "GL_[_0-9a-zA-Z]*"
syn match myDarkRed "OGL_[_0-9a-zA-Z]*"
syn match myPurple "WGL_[_0-9a-zA-Z]*"
" highlight ogl guifg='Purple'
" syn match ogl "[ \t]gl[A-Z][0-9a-zA-Z]*"

" Highlights all characters in virtual column 80 and 120
"highlight rightMargin1 guibg=#dfa0a0
"syn match rightMargin1 /\%<81v.\%>80v/
highlight rightMargin2 guibg=#d0d0d0
syn match rightMargin2 /\%>120v[^:?\(\){}\[\]]\+/
" highlight BadCurlyBrace guibg=#ff0000
" syn match BadCurlyBrace /\S\s*{/

let c_no_comment_fold = 1
let c_space_errors = 1
let c_cpp_comments = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  New Stuff                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search into subfolders; tab-completion for files
set path +=**

" A better backspace
" set backspace=indent,eol,start

" Enable mouse
set mouse=a

" Wrap text at word boundary
" set wrap
" set lbr
" set showbreak=&

" Default
set encoding=utf-8

" toggle invisible characters
" set list
" set listchars=tab:→\ ,eol:¬,trail:°,extends:»,precedes:«
set nolist

" Split right of current window
" set splitright

" Split below of current window
" set splitbelow

" Automatic saving
" set autowrite

" Hide buffer when abandoned
set hidden

" Dont show status since it's in lighline
" set noshowmode

" Change complete menu behavior
" set completeopt=menu,menuone

" set lazyredraw

" No sounds on errors
" set noerrorbells
" set novisualbell
" set t_vb=

" set nostartofline
" set confirm

" toggle between 'paste' and 'nopaste'
" nnoremap <F12> :set invpaste paste?<CR>
" imap <F12> <C-O>:set invpaste paste?<CR>
" set pastetoggle=<F12>

" set diffopt+=vertical

" print path
" map <C-f> :echo expand("%:p")<cr>

" quick insert character to end of line
" imap <F1> <Esc>v`^me<Esc>gi<C-o>:call Ender()<CR>
" function! Ender()
"   let endchar = nr2char(getchar())
"   execute "normal \<End>a".endchar
"   normal `e
" endfunction

" nnoremap <silent> <Leader>df :call DiffToggle()<CR>

" function! DiffToggle()
"     if &diff
"         windo diffoff
"     else
"         windo diffthis
"     endif
" :endfunction

" Insert current date
imap <silent> <C-D><C-D> <C-R>=strftime('%e %b %Y')<CR>

"Insert current time  %l not working
"imap <silent> <C-T><C-T> <C-R>=strftime('%l:%M %p')<CR>

"Insert current working directory
iabbrev <silent> CWD <C-R>=getcwd()<CR>

" To exe date on cmd line and put output in file
":r !date

"Locate and return character "above" current cursor position...
function! LookUpwards()
	"Locate current column and preceding line from which to copy...
	let column_num      = virtcol('.')
	let target_pattern  = '\%' . column_num . 'v.'
	let target_line_num = search(target_pattern . '*\S', 'bnW')

	"If target line found, return vertically copied character...
	if !target_line_num
		return ""
	else
		return matchstr(getline(target_line_num), target_pattern)
	endif
endfunction
"Reimplement CTRL-Y within insert mode...
imap <silent>  <C-Y>  <C-R><C-R>=LookUpwards()<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Grep.vim                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\grep.exe'
let Egrep_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\egrep.exe'
let Fgrep_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\Fgrep.exe'
let Grep_Find_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\find.exe'
let Grep_Xargs_Path = 'C:\\Users\\jcnarlo\\jcnarlo\\local\\bin\\GetGnuWin32\\gnuwin32\\bin\\xargs.exe'

let Grep_Default_Filelist = 'src include'
let Grep_Default_Options = '-R'
let Grep_Cygwin_Find = 0
let Grep_Skip_Dirs = 'tmp .svn .git share builds __pycache__ python'
let Grep_Skip_Files = 'tags .*.swp *.obj *.bak *.tmp *.exe *.lib *.dll *.a *.so *.pdb *~ *,v s.*'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                project.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:proj_flags = "gimst"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                python
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
"                                delimitMate                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 GitGutter                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap ]h :GitGutterNextHunk<CR>
" nmap [h :GitGutterPrevHunk<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Goyo                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>m :Goyo<CR>

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

" autocmd FileType go nmap <Leader>b  <Plug>(go-build)
" autocmd FileType go nmap <Leader>r  <Plug>(go-run)
" autocmd FileType go nmap <Leader>t  <Plug>(go-test)
" autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" autocmd FileType go nmap <Leader>i <Plug>(go-info)
" autocmd FileType go nmap <silent> <Leader>e  <Plug>(go-install)
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

" create a go doc comment based on the word under the cursor
" function! s:create_go_doc_comment()
" 	norm "zyiw
" 	execute ":put! z"
" 	execute ":norm I// \<Esc>$"
" endfunction
" nnoremap <Leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  vim-json                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:vim_json_syntax_conceal = 0
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType json set foldmethod=syntax
autocmd FileType json set conceallevel=0

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
vnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gb :Gblame<CR>

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
