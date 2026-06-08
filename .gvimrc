""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  SETTINGS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
unmap <C-f>
" mode = nivc
"if !empty(maparg('<C-f>', 'n') == '')
"	unmap <C-f>
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager is Vim-Plug: https://github.com/junegunn/vim-plug
" To Update (from a windows cmd prompt) call :PlugUpdate
"jcnii2 silent!call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/plugged')


" Utils
" Plug 'airblade/vim-gitgutter' " show git diff in sign column
"jcnii Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finde
"Plug 'elzr/vim-json', { 'for': 'json' } " json highlighting
" Plug 'honza/vim-snippets' " snippet files
" Plug 'Raimondi/delimitMate' " automatic closing of surrounds
Plug 'scrooloose/nerdtree' " amazing file explorer
" Plug 'sirver/ultisnips' " snippet engine
"jcnii Plug 'ntpeters/vim-better-whitespace' " whitespace management
Plug 'yegappan/grep' " Grep
Plug 'vim-scripts/grep.vim'
Plug 'hdima/python-syntax'
Plug 'bfrg/vim-cpp-modern'
" From earlier
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'frazrepo/vim-rainbow'
" Plug 'vim-scripts/taglist.vim'
" Plug 'StanAngeloff/php.vim'

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
" Plug 'HenryNewcomer/vim-theme-papaya'
" Plug 'fatih/molokai' " color scheme
" Plug 'Reewr/vim-monokai-phoenix'  "color scheme
" Plug 'crusoexia/vim-monokai'  "color scheme
" Plug 'napcs/vim-mycontrast'
" Plug 'Heorhiy/VisualStudioDark.vim'
" Plug 'vim-scripts/dante.vim'
" Plug 'gkjgh/cobalt'
"Plug 'nightsense/plumber'
"Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " focus tool
"Plug 'itchyny/lightline.vim' " status bar
"jcnii Plug 't9md/vim-choosewin' " window label overlay
Plug 'yunlingz/equinusocio-material.vim'
" Plug 'equinusocio/vsc-material-theme'

call plug#end()

" colorscheme papaya
" let g:molokai_original = 1
" colorscheme molokai
"colorscheme monokai-phoenix
" colorscheme crusoexia/vim-monokai
"let g:monokai_term_italic = 0
"let g:monokai_gui_italic = 0
"colorscheme mycontrast
"colorscheme VisualStudioDark
"colorscheme dante
"colorscheme cobalt
"
"colorscheme plumber-dark
"
" use a different style
" valid values: 'default' (default), 'darker', 'pure'
let g:equinusocio_material_style = 'pure'

" less bright
" which means some colors will be modified by this formula:
" (r, g, b) -> ( max(r - less, 0), max(g - less, 0), max(b - less, 0) )
let g:equinusocio_material_less = 50

" make vertsplit invisible (visible by default) (default 0)
" if style == 'pure', then the vertsplit is always visible
let g:equinusocio_material_hide_vertsplit = 1

" parentheses improved (default 0)
" enabling this option with 'luochen1990/rainbow' installed is not encouraged
" because this option and 'luochen1990/rainbow' will registry conflicting events
" in summary:
" 1. no 'luochen1990/rainbow' installed, no parentheses improved: nothing to do (default 0)
" 2. no 'luochen1990/rainbow' installed, want built-in parentheses improved: set to 1
" 3. 'luochen1990/rainbow' installed: nothing to do (default 0)
let g:equinusocio_material_bracket_improved = 1

" use a better vertsplit char
set fillchars+=vert:│

colorscheme equinusocio_material

" this theme has a buildin lightline/airline theme
let g:airline_theme = 'equinusocio_material'
let g:lightline = {
  \ 'colorscheme': 'equinusocio_material',
  \ }
""
