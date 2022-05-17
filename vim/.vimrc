" vim:fdm=marker
set nocompatible
filetype off

" Use space as leader
let mapleader = "\<Space>"

" Vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" The bundles you install will be listed here
" Buffers as tabs
"Plugin 'ap/vim-buftabline'
" Git?
Plugin 'tpope/vim-fugitive'
" File browser (Not needed - use netrw)
"Plugin 'scrooloose/nerdtree'
" Python code folding
Plugin 'tmhedberg/SimpylFold'
" Python linting
Plugin 'nvie/vim-flake8'
" Awesome bar at bottom
"Plugin 'bling/vim-airline'
" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
" Writing plugins
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-lexical'
Plugin 'reedes/vim-litecorrect'
Plugin 'junegunn/goyo.vim'
" Surrounding
Plugin 'tpope/vim-surround'
" Arduino
Plugin 'jplaut/vim-arduino-ino'
" Autocompletion (Disabled because annoying)
"Plugin 'davidhalter/jedi-vim'
" Molokai colour scheme
" Plugin 'tomasr/molokai'
" Base16 colour scheme
" Plugin 'chriskempson/base16-vim'
" gruvbox colour scheme
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on
" }}} End Vundle

" The rest of your config follows here

" Functionality changes {{{
" Use spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set expandtab

" Set undo history size
set history=500

" Automatically change window's cwd to file's dir
set autochdir

" Toggle line numbers (and default to shown)
"nmap <C-n><C-n> :set invnumber<CR>
set invnumber

" Highlight line cursor is on
set cursorline

" Fix backspace behaviour
set backspace=2

" Keep a few lines above/below cursor when scrolling
set scrolloff=3

" Relative line numbering {{{
set relativenumber

" Toggle relative numbering with C-n
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Change to absolute when focus is lost
:au FocusLost * :set number
:au FocusGained * :set relativenumber
" }}}

" Writing focus {{{
nnoremap <Leader>w :Goyo<Cr>
" }}}
" }}}

" Keyboard mappings {{{
" Tab mapping {{{
" Experimenting with unmapping these to use the defaults
"nnoremap <C-h> :tabprevious<CR>
"nnoremap <C-l> :tabnext<CR>
"nnoremap <C-t> :tabnew<CR>
"inoremap <C-h> <Esc>:tabprevious<CR>
"inoremap <C-l> <Esc>:tabnext<CR>
"inoremap <C-t> <Esc>:tabnew<CR>
"map <C-j> :execute "tabmove" tabpagenr() - 2 <CR>
"map <C-k> :execute "tabmove" tabpagenr() <CR>
" }}}

" Convenience remaps {{{
nnoremap G Gzz
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
" }}}

" Makemaps {{{
autocmd FileType markdown nnoremap <Leader>m :InstantMarkdownPreview<CR>
autocmd FileType processing nnoremap <Leader>m :make<CR>
" }}}

" Use the mouse, Luke {{{
set mouse=a
set ttymouse=sgr
" }}}

" Copy and paste {{{
nmap <Leader>p "+p
nmap <Leader>y "+y
vmap <Leader>p "+p
vmap <Leader>y "+y
" }}}

"}}} End keyboard mappings

" Search settings {{{
set hlsearch    " Highlights search terms
set showmatch   " shows matching brackets
set ignorecase  " ignores case when searching
set smartcase   " Unless you put some caps in your search term
set incsearch   " Start searching while typing
nnoremap <F3> :set hlsearch!<CR>

" File search settings
" I should be using :find
set path+=**    " Search down into subfolders
set wildmenu    " Display all matching files when tab-completing

" netrw settings
let g:netrw_banner=0    " Disable annoying banner
let g:netrw_liststyle=3 " Tree view
let g:netrw_list_hide=netrw_gitignore#Hide()

" Keep search terms in the middle of the buffer
nmap n nzzzv
nmap N Nzzzv
" }}}

" Python stuff {{{
" Python highlight lines > 80 
"autocmd FileType Python call SetOverlengthHighlight()
"function SetOverlengthHighlight()
"    highlight OverLength ctermbg=red ctermfg=white guibg=#59292
"    match OverLength /\%80v.\+/
"endfunction
" Above function never seemed to work and I'm not too fussed anyway

" Disable smartindent for hashes
" Without this, entering a hash in insert mode takes you
" to the start of the line
autocmd BufRead *.py inoremap # X<c-h>#

" Mapping Control-r to run python files
" Needs a better shortcut - disabled for now
"autocmd FileType python nnoremap <buffer> <C-r> :exec "!python3" shellescape(@%, 1)<CR>
"nnoremap <C-w>u :redo<CR> "This is why it needs a better shortcut
autocmd FileType python nnoremap <buffer> <Leader>r :exec "!python3" shellescape(@%, 1)<CR>
" }}}

" Arduino stuff {{{
" Set tab size to 2
autocmd FileType arduino setlocal tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=syntax
" }}}

" Theme stuff {{{
set background=dark

" Use gui colours in the terminal
" Turn off when in tmux so colour scheme actually shows
"if has("termguicolors") && !exists('$TMUX')
"    set termguicolors
"endif

set guifont=Source\ Code\ Pro\ Medium\ 10
if has("gui_running")
    " colo molokai
    colo gruvbox
else
    " colo base16-default
    " colo molokai
    colo gruvbox
endif

" Statusline {{{
set laststatus=2            " Always show

" Magenta underline in insert mode and grey background in normal
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

set statusline+=%{exists('g:loaded_fugutive')?fugitive#statusline():''}
set statusline=%-.40F           " Filepath
set statusline+=%r              " Readonly
set statusline+=%m              " Modified
set statusline+=%=              " Switch to right side
set statusline+=\ %y            " Filetype
set statusline+=\ \ B:%-2n      " Buffer number
set statusline+=\ %p%%          " Percentage
set statusline+=\ \ %3.5l:      " Line number
set statusline+=%-3.5c          " Column number
" }}}

" Enable syntax highlighting
syntax on

" }}}

" Plugins {{{
" Writing (vim-pencil, vim-lexical) {{{
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'}) |
                                \ call lexical#init() |
                                \ call litecorrect#init()
    autocmd FileType latex,tex    call pencil#init({'wrap': 'soft'}) |
                                \ call lexical#init() |
                                \ call litecorrect#init()
augroup END

let g:pencil#textwidth = 50
let g:pencil#cursorwrap = 1
" }}}

" Map F2 to toggle file explorer
"map <F2> :NERDTreeToggle<CR>
map <F2> :Lex<CR>

" Markdown {{{
" Change how folding works with vim-markdown
let g:vim_markdown_folding_style_pythonic = 1

" If preview too fast, enable this
"let g:instant_markdown_slow = 1

" Don't start with every markdown file
let g:instant_markdown_autostart = 0

" Mapping for starting preview
autocmd FileType markdown nnoremap <Leader>m :InstantMarkdownPreview<CR>
" }}}

" HTML {{{
autocmd FileType html nnoremap <Leader>b :exe ':silent !firefox %'<CR>
" }}}

" vim-airline stuff {{{
"let g:airline_powerline_fonts = 1
"set laststatus=2
"set ttimeoutlen=50
"set noshowmode
"let g:airline_section_x = '%{PencilMode()}'
" }}}

" Arduino highlighting {{{
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino
au BufNewFile,BufRead *.pde setlocal ft=arduino
au BufNewFile,BufRead *.ino setlocal ft=arduino
" \ac - compile. \ad - deploy. \as - serial monitor
" }}}

" Add docstring to fold text in python files
let g:SimpylFold_docstring_preview = 1

" }}} end plugins

" Platform-specific {{{
if has("win32")
    " Fix cursor in mingw
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"

    " Use Consolas as font
    set guifont=Consolas:h10:cANSI:qDRAFT
else
    if has("unix")
        " Linux stuff
    endif
endif
" }}}
