"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                                                       ""
""                                                                       ""
""      This is the .vimrc of Marek Schiffer. Do not read :)             ""
""                                                                       ""
""                                                                       ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Unpap the arrow keys""""""""""""""""""""""""""""""""""""""""""""""""""""""
"This is primaraly be done for getting used to vim.
"<Nop> stands for No Operation

noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>

inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>

vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>
vnoremap <up> <Nop>

" Mapping for ESC key, Touchbar Sucks
" visual and select mode
"vmap § <esc>
"" insert mode
"imap § <esc>
"" normal mode
"nmap § <esc>
"" Visual mode
"xmap § <esc>
"" Command-line mode
"cmap § <esc>
"vmap jj <esc>
"imap jj <esc>
"nmap jj<esc>

"<leader>§

set ttimeoutlen=100

"Use bash shell for vim. Necessary for LaTeX Box at the moment
set shell=/opt/homebrew/bin/bash

" Snimpate new parser
let g:snipMate = { 'snippet_version' : 1 }

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
"Allowing Plugins to be used"""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on

"Basic Settings""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set laststatus=2

"Setting History and Undolevels up"""""""""""""""""""""""""""""""""""""""""
set history=1000
set undolevels=1000

set belloff=all
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
"Set Numbers"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
"Set CursorLine and Cursorcolumn """"""""""""""""""""""""""""""""""""""""""
set cursorline
set cursorcolumn
set colorcolumn=81

"Setting up custom behaviours""""""""""""""""""""""""""""""""""""""""""""""""


"Folds"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"save folds and load them automatically
autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview "

function! MyFoldText() "
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…'. repeat(" ",fillcharcount) . foldedlinecount .'…' . ' '
endfunction "
set foldtext=MyFoldText()

"Splits movement"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright

" I nver use this""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

"Resize splits in steps of 3""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <c-right> :vertical resize +3<cr>
nnoremap <m-left> :vertical resize -3<cr>
nnoremap <m-up> :resize +3<cr>

" Resize splits when the window is resized
 au VimResized * :wincmd =

"Setting the tabs"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set ts=4 sts=4 sw=4 noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=8
"set noexpandtab "Uses tabs instead of whitespaces
set expandtab "Uses spaces instead of tabs

"Cursorline"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Only show cursorline in the current window and in normal mode.

"augroup cline
"    au!
"    au WinLeave,InsertEnter * set nocursorline
"    au WinLeave,InsertEnter * set nocursorcolumn
"    au WinEnter,InsertLeave * set cursorline
"    au WinEnter,InsertEnter * set cursorcolumn
"augroup END

"Wildmenu completion""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

set wildignore+=*.fasl                           " Lisp FASLs

"Whitespaces""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Show trailing whitespaces"""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Clean trailing " whitespace"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ww mp:%s/\s\+$//<cr>:let @/=''<cr>normal!`ep

"Backups""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backup
set noswapfile

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

"Change scrolling behavior
set scrolloff=3
set sidescroll=1
set sidescrolloff=10

"Typos that can drive you crazy""""""""""""""""""""""""""""""""""""""""""""""
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

"Some new functionality and hacks""""""""""""""""""""""""""""""""""""""""""""

"Scrooloose hack (visualizes * and "#)"""""""""""""""""""""""""""""""""""""""""
"function! s:VSetSearch()
"  let temp = @@
"  norm! gvy
"  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
"  let @@ = temp
"endfunction
"
"vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
"vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

"Make sure Vim returns to the same line when you reopen a " file.""""""""""""""
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"Better Behavior of >> Fiels form vimbits""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv

"Emacs-Mode Control bindings for insert mode and control " mode""""""""""""""""""""
inoremap <c-a> <home>
inoremap <c-e> <end>

cnoremap <c-a> <home>
cnoremap <c-e> <end>

"Motion for "next/last object:, for example "din( will go to the next "()"
"pair and delete its contetns.

onoremap an :<c-u>call <SID>NextTextObject()<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
	let c = nr2char(getchar())

	if c==# "b"
		let c ="("
	elseif c==# "B"
		let c ="{"
	elseif c==# "d"
		let c ="["
	endif

	exe "normal! ".a:dir.c."v".a:motion.c
endfunction

"Replace german characters """"""""""""""""""""""""""""""""""""""""""""""""""
function! UmlauteEinfuegen()
	normal! my
	1,$ s/\\"a/ä/g
	1,$ s/\\"A/Ä/g

	1,$ s/\\"o/ö/g
	1,$ s/\\"O/Ö/g

	1,$ s/\\"u/ü/g
	1,$ s/\\"U/Ü/g

	1,$ s/\\ss \\/ß/g
	1,$ s/\\ss /ß/g
	normal `y
endfunction

function! UmlauteHerausnehmen()
	normal my
	1,$ s/ä/\\"a/g
	1,$ s/Ä/\\"A/g

	1,$ s/ö/\\"o/g
	1,$ s/Ö/\\"O/g

	1,$ s/ü/\\"u/g
	1,$ s/Ü/\\"U/g

	1,$ s/ß /\\ss \\ /g
	1,$ s/ß/\\ss /g
	normal! `y
endfunction

nnoremap <leader>u :call UmlauteEinfuegen() <cr>
nnoremap <leader>ru :call UmlauteHerausnehmen() <cr>

"Plugins"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"The following is from vundle """"""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set rtp+=~/.vim/bundle/vim-hemisu/colors
set rtp+=~/.vim/bundle/Vundle.vim
if has('win32') || has ('win64')
    set rtp+=$HOME\.vim\bundle\powerline\powerline\bindings\vim
endif
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'rodnaph/vim-color-schemes'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'powerline/powerline' , {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-surround'
Plugin 'tomasiser/vim-code-dark'
Plugin 'latex-box-team/latex-box'
"The following plugins are required for snippets
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'MarekSchiffer/Silverfast_IPTCData_Creator'
"Plugin 'L-TChen/auto-dark-mode.vim'

call vundle#end()            " required
filetype plugin indent on    " required


au FileType c set makeprg=gcc\ %

"Setting up the Colorscheme for GUI and Terminal"""""""""""""""""""""""""""
if has("gui_running")
  syntax on
  colorscheme hemisu
  set background=light
else
      syntax on
      set t_Co=256
      "colorscheme murphy
      "colorscheme hemisu
      colorscheme codedark
	  set background=dark
      "colorscheme peachpuff "George Hotz Ugly as fuck!
	  highlight Comment ctermfg=white
	  set mouse=
	  set ttymouse=
endif

"Setting up Plugins""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_python = 'python3'


"Setting up search behaviour"""""""""""""""""""""""""""""""""""""""""""""""""
"Search with the highlight feature needs to be behind the colorscheme""""""""
set incsearch
set showmatch "Jumps to the opening bracket when closing itx
set hlsearch  "highlights all search results

"highlight CurSearch guibg=purple
if has("gui_running")
  highlight CurSearch guibg=green
else
  highlight CurSearch ctermbg=24
endif

function! HighlightCurrentMatch()
    let col = col(".") - 1
    let endCol = searchpos(getreg("/"), "cne")[1] + 1
    let line = line(".")
    let matchPat = '/\%' . line . 'l\%>' . col . 'c\%<' . endCol . 'c/'
    echomsg matchPat

    3match none
    exe ':3match CurSearch ' . matchPat
endfunction

"remove highlighted searches
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv



"Setting up Powerline for GUI and Terminal"""""""""""""""""""""""""""""""""

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
      let g:Powerline_symbols = "fancy"
   endif
   if has('win32') || has ('win64')
       set guifont=Inconsolata_for_Powerline:h12:W500:cANSI:qDRAFT
       let g:Powerlin_symbols= "fancy"
	   set guioptions-=T
   endif
endif

"Mapping \N to NERDTree""""""""""""""""""""""""""""""""""""""""""""""""""""
" The <CR> stands for Character Return i.e.Enter"""""""""""""""""""""""""""
no <leader>N :NERDTree<CR>


"Letting .tex files be reconized""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'

let g:LatexBox_latexmk_async=1
"let g:LatexBox_latexmk_env = 'latexmk -pdf'
let g:LatexBox_latexmk_options = '-pdf -interaction=nonstopmode'
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_verbose=1
let g:LatexBox_quickfix=1
let g:Tex_GotoError=1    "Prevent LaTeX tmk to jump intro Warning split
let g:Tex_GotoWarning=1    "Prevent LaTeX tmk to jump intro Warning split
"Filespecific Settings"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Assembly

augroup ft_asm
    au!
    au FileType asm setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8
augroup END

" Assembly x_86

augroup ft_s
    au!
    au FileType s setlocal foldmethod=marker foldmarker={,}
    au FileType s setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" tex

augroup ft_tex
	au!
	au FileType tex setlocal colorcolumn=130
	au FileType tex setlocal tw=125
augroup END

" c

augroup ft_c
    au!
    au FileType c setlocal foldmethod=marker foldmarker={,}
    au FileType c setlocal ts=2 sts=2 sw=2 expandtab
"    au FileType c setlocal ts=3 sts=3 sw=6 noexpandtab
augroup END

" c++

augroup ft_cpp
    au!
    au FileType cpp setlocal foldmethod=marker foldmarker={,}
    au FileType cpp setlocal ts=2 sts=2 sw=2 expandtab
"    au FileType cpp setlocal ts=4 sts=4 sw=8 noexpandtab
augroup END

" Python

augroup ft_py
    au!
    au FileType py setlocal foldmethod=marker foldmarker={,}
    au FileType py setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" HTML
augroup ft_html
    au!
    au FileType html setlocal foldmethod=marker foldmarker={,}
    au FileType html setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" CSS
augroup ft_css
    au!
    au FileType css setlocal foldmethod=marker foldmarker={,}
    au FileType css setlocal ts=3 sts=3 sw=3 noexpandtab
augroup END

