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


let g:Powerline_symbols = "fancy"
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set laststatus=2
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

let g:pymode_python = 'python3'

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

let g:LatexBox_latexmk_async=1
let g:LatexBox_latexmk_preview_continuously=1

" let g:LatexBox_latexmk_options = "-d -pvc -pdf"
"let g:LatexBox_viewer = "Skim"  "For Mac OS X


" The following is form vundle"""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible               " be improved
"filetype off                   " required!
"
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()              " let Vundle manage Vundle
"
"" required! 
"Bundle 'gmarik/vundle'
"
"" My Bundles here:
"" NOTE: comments after Bundle command are not allowed..
"Bundle 'scrooloose/nerdtree'
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'honza/vim-snippets'
"Bundle 'garbas/vim-snipmate'
""Bundle 'schlamar/latexmk.py'
"Bundle 'LaTeX-Box-Team/LaTeX-Box'
"
"filetype plugin indent on     " required!

" The following is form vundle NEW"""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/powerline' , {'rtp': 'powerline/bindings/vim/'}
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'latex-box-team/latex-box'
Plugin 'easymotion/vim-easymotion'
Plugin 'MarekSchiffer/Silverfast_IPTCData_Creator'

call vundle#end()            " required
filetype plugin indent on    " required


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

""Functions for IPTC Daten Silverfast"""""""""""""""""""""""""""""""""""""
"
"function! NameSubstitution()
"	normal! ma
"	/Name
"	normal!	f:wy$
"	:bn
"	/IPTCObject
"	normal! jddgg
"	:w
"	:bp
"	normal! `a
"endfunction	
"
"function! DateSubstitution()
"	normal! mb
"	/Date
"	execute "normal! f:wyW"
"	:bn
"	/IPTCDate
"	execute "normal! o\<esc>p0i\t\t\<esc>0"
"	execute "normal! wf.;lywA\<space>\<esc>pBBf.lyw$pBByw$pBBdWjddgg"
"	:w
"	:bp
"	execute "normal! `b"
"endfunction	
"
"function! StateSubstitution()
"	normal! mc
"	/State
"	execute "normal! f:wy$"
"	:bn
"	/IPTCProvince
"	execute "normal! o\<esc>p0i\t\t\<esc>0"
"	:s / /%20/g
"	execute "normal! jddgg"
"	:w
"	:bp
"	execute "normal! `c"
"endfunction	
"
"function! CitySubstitution()
"	normal! md
"	/City
"	execute "normal! f:wy$"
"	:bn
"	/IPTCCity
"	execute "normal! o\<esc>p0i\t\t\<esc>0"
"	:s / /%20/g
"	execute "normal! jddgg"
"	:w
"	:bp
"	execute "normal! `d"
"endfunction	
"
"
"function! CaptionSubstitution()
"	execute "normal! me"
"	/Caption
"	execute "normal! f:wy$"
"	:bn
"	/IPTCCaption
"	execute "normal! o\<esc>p0i\t\t\<esc>0"
"	:s / /%20/g
"	execute "normal! jddgg"
"	:w
"	:bp
"	execute "normal! `e"
"endfunction	
"
"function! Sub()
"	execute "normal! j0y$0"
"	normal mb
"	:bn
"	/IPTCKeywords
"	execute "normal! jo\<esc>p0"
"	:s / /%20/g
"	execute "normal! kJxgg"
"	:w
"	:bp
"	execute "normal! 'b"
"endfunction
"
"function! KeywordsSubstitution()
"	normal mz
"	/KeywordCount
"	normal f:w"hyw
"	let var=@h
"
"	let c=1
"
"	/Keywords
"	normal mb
"	while c <= var
"		:call Sub()
"		let c += 1
"	endwhile 
"
"	execute "normal! `z"
"endfunction	
"
"function! KeywordCounter()
"	normal mf
"	/KeywordCount
"	normal f:w"hyw
"	let var=@h
"	let sta = 2
"	let var += sta 
"	let @q = var
"	:bn
"	/IPTCKeywordCount
"	execute "normal! jddO\<esc>0"
"	normal "qp
"	execute "normal! 0i\<tab>\<tab>\<esc>wa\%20gg"
"	:w
"	:bp
"	execute "normal! `f"
"endfunction
"
"function! CreateFilename()
"	normal! mf
"	/Name
"	execute "normal! f:/Film\<cr>w"
"	normal "5yw
"	execute "normal! /Photo\<cr>w"
"	normal "6yw
""	let name="f".{@5}."f".{@6}
"	execute "normal! ggOf\<esc>"
"	normal "5p
"	execute "normal! if\<esc>"
"	normal "6p
"	execute "normal Bywdd"
"	execute "normal `f"
"	:w
"endfunction	
"
"function! Wrap()
"	normal mw
"	:call CreateFilename()
"	let filename = @"
"	let name = "/Users/schiffer/".filename
"	execute ':badd' . "/Users/schiffer/Desktop/IPTC_Template"
"	:bn
"	execute ':sav'. name 
"	:bp
"	execute "normal `w"
"	:call NameSubstitution()
"	:call DateSubstitution() 
"	:call StateSubstitution()
"	:call CitySubstitution()
"	:call KeywordCounter()
"	:call CaptionSubstitution()
"	:call KeywordsSubstitution()
"	:.+,$bwipeout
""	:2,$-bdelete
""	:bd 2
""	:bd 3
"endfunction
"
"
"nnoremap <leader>n :call NameSubstitution() <cr>
"nnoremap <leader>d :call DateSubstitution() <cr>
"nnoremap <leader>s :call StateSubstitution() <cr>
"nnoremap <leader>t :call CitySubstitution() <cr>
"nnoremap <leader>c :call CaptionSubstitution() <cr>
"nnoremap <leader>k :call KeywordsSubstitution() <cr>
"nnoremap <leader>h :call CreateFilename() <cr>
"nnoremap <leader>z :call KeywordCounter() <cr>
"nnoremap <leader>w :call Wrap() <cr>
"
