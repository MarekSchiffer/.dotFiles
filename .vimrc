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

no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" Mapping 

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"Setting History and Undolevels up"""""""""""""""""""""""""""""""""""""""""
set history=700
set undolevels=700

"Show whitespaces
":MUST be inserted BEFORE colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/
     
"Setting up the Colorscheme for GUI and Terminal"""""""""""""""""""""""""""
if has("gui_running") 
  syntax on
  colorscheme hemisu
  set background=light
else
      syntax on
      colorscheme murphy
endif

"Set Numbers"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set nu

"Set CursorLine and Cursorcolumn """""""""""""""""""""""""""""""""""""""""
set cursorline
set cursorcolumn

"Better Behavior of >> Fiels form vimbits""""""""""""""""""""""""""""""""""
vnoremap < <gv
vnoremap > >gv

"Allowing Plugins to be used"""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on

"Mapping \N to NERDTree""""""""""""""""""""""""""""""""""""""""""""""""""""
" The <CR> stands for Character Return i.e.Enter"""""""""""""""""""""""""""
no <leader>N :NERDTree<CR>

"Setting the LaTeX Viewer""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Tex_ViewRule_pdf = "okular"

"Letting .tex files be reconized"""""""""""""""""""""""""""""""""""""""""""" 
let g:tex_flavor='latex'

"Setting up the LaTeXBox"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LatexBox_viewer = "okular" "For Linux
let g:LatexBox_output_type="pdf"
let g:LatexBox_latexmk_options = "-d -pvc -pdf"
"let g:LatexBox_viewer = "Skim"  "For Mac OS X


" The following is form vundle"""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be improved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()              " let Vundle manage Vundle

" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
" NOTE: comments after Bundle command are not allowed..
Bundle 'scrooloose/nerdtree'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
"Bundle 'schlamar/latexmk.py'
Bundle 'LaTeX-Box-Team/LaTeX-Box'

filetype plugin indent on     " required!

au FileType c set makeprg=gcc\ %
au FileType cpp set makeprg=g++\ %
"set backupdir=~/.vim/backup/
"set directory=~/.vim/swap/
"
"Setting the tabs""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set ts=4 sts=4 sw=4 noexpandtab

"Setting the compiler"""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter *.cpp compiler g++

function! UmlauteEinfuegen()
	1,$ s/\\"a/ä/g
	1,$ s/\\"A/Ä/g

	1,$ s/\\"o/ö/g
	1,$ s/\\"O/Ö/g

	1,$ s/\\"u/ü/g
	1,$ s/\\"U/Ü/g

	1,$ s/\\ss \\/ß/g
	1,$ s/\\ss /ß/g
endfunction

function! UmlauteHerausnehmen()
	1,$ s/ä/\\"a/g
	1,$ s/Ä/\\"A/g

	1,$ s/ö/\\"o/g
	1,$ s/Ö/\\"O/g

	1,$ s/ü/\\"u/g
	1,$ s/Ü/\\"U/g

	1,$ s/ß /\\ss \\ /g
	1,$ s/ß/\\ss /g
endfunction

nnoremap <leader>u :call UmlauteEinfuegen() <cr>
nnoremap <leader>ru :call UmlauteHerausnehmen() <cr>
"nnoremap <leader>sop :source % <cr>
