set nocompatible

filetype off 

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set path=.,,./**,$MYGITROOT/sportsbook/**,$MYGITROOT/**,$HOME/**
set cdpath=.,,$CDPATH

set viminfo='500,f1,<500,:200,@200,/200,c,%

set background=dark
syntax enable " 

" backup options
set backupdir=~/tmp,/tmp " backups (~)
set directory=~/tmp,/tmp " swap files
set backup " enable backups

" map notes
" in insert mode <c-o> (<C-O>) changes into command mode for a single command
" so imap abc <c-o>do_thing allows a single command to work in insert mode.
" to see where a mapping was made, can run :verbose map (for all commands) or
" :verbose map <cmd> - see :help map-listing
"
set guifont=Monospace\ 9

set backspace=2

imap <c-a> <esc>ggVG
nnoremap <c-a> ggVG

" show the status bar
set laststatus=2
set title
" set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-39(bytval=0x%B,%n%Y%)\%P
set statusline=%<%f\%h%m%r\ %{fugitive#statusline()}%=%-10.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

" not interested in editing pyc files
set suffixes+=.pyc

" stoopid mouse
set mouse=a

" indenting
" set smartindent
" set autoindent
filetype on
filetype plugin indent on

" to disable automatic commenting
"
" au FileType * setl fo-=cro

set ic " ignore case in search
set incsearch " incremental search
set hlsearch " highlight search results (switch off with screen redraw <C-L>)
set smartcase " ignore case when lowercase

" One of the most important options to activate. Allows you to switch from an
" " unsaved buffer without saving it first. Also allows you to keep an undo
" " history for multiple files. Vim will complain if you try to quit without
" " saving, and swap files will keep you safe if your computer crashes.
set hidden

" Show partial commands in the last line of the screen
set showcmd

" don't expand tabs
set tabstop=4
set shiftwidth=4
set noexpandtab
" expandtab inserts tabs instead of spaces
" set expandtab
" smarttab changes spaces inserted at the start of a line when tabbing
" set smarttab

" open new windows on the right
set splitright

" change directory automatically (the current directory will be that of the current buffer)
set autochdir

" filename auto completion
" set wildmode=longest:full
set wildmenu

" always have some lines of text when scrolling
set scrolloff=3

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

set textwidth=80
set colorcolumn=+1
highlight ColorColumn guibg=#2d2d2d ctermbg=246

" don't jump over text-wrapped lines
" Might want to take a quick look at the documentation for map to see if it should only apply in certain modes
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk


" Disable annoyances
"
" Shamed into reneabling q macros by Farmer and Oli
" " disable annoying 'q' command until I understand what it does properly
" noremapq ""
"
" This one enters ex mode.
nmap Q ""

" underscore as word delimiter
" set iskeyword-=_

" Y should yank to the end of the line
noremap Y y$

"Replace current selection with buffer
vmap r "_dP

" Cycle through windows with F6 (and back with Shift-F6
" nnoremap <F6> <C-W>w
" nnoremap <S-F6> <C-W>W

" Cycle through open files with Ctrl-N and Ctrl-P
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>

" tab navigation with alt left / alt right
nnoremap  <a-right>  gt
inoremap  <a-right>  <c-o>gt
nnoremap  <a-left>   gT
inoremap  <a-left>   <c-o>gT

" can't remap tab - it also remaps <ctrl-I>
" window cycling with tab
nnoremap <s-tab> <c-w>w

" ctags tutorial
" http://www.vim.org/tips/tip.php?tip_id=94
" omnicpp auto completion
" http://www.vim.org/scripts/script.php?script_id=1520
" filetype plugin on

" create ctags
map <C-f12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" no automatic popup for '.', '->'
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
" other stuff
let OmniCpp_LocalSearchDecl = 1
let OmniCpp_ShowPrototypeInAbbr = 1
" close preview window automatically
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" use STL sources using the _GLIBCXX_STD macro
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" use system-wide tags created with
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -o ~/system.tags /usr/include
"set tags+=~/system.tags
set tags=./tags;
set tags+=~/git/PROJ-Coral/tags;

highlight CursorLine term=reverse cterm=NONE ctermbg=7 guibg=LightRed
highlight CursorColumn term=reverse cterm=NONE ctermbg=7 guibg=DarkMagenta

" open files in the file path in a new tab (file under the cursor)
" vim-recipes
nnoremap gf <C-W>gf

" git
" http://michaelxavier.net/Git-vim-bindings-for-fugitive-vim.html
"rebind my favorite commands from Git.vim for Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gb :Gblame<cr>


" printing options
" vim-recipes - 35
" ':hardcopy' prints
" see also, discussion on cups-pdf and printing to pdf using :set pdev=pdf
set printoptions=paper:A4,syntax:y,wrap:y

" http://vim.wikia.com/wiki/Python_-_check_syntax_and_run_script
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead *.py nmap <c-F5> :!python %<CR>

" whitespace tabs
" TODO: do something in visual mode
"
" Insert tabs at the start of the line [in insert mode]
inoremap <Tab> <C-T>
" shift-tab to remove tabs (indentation) [in insert mode]
inoremap <S-Tab> <C-D>

" Function Key Mappings

" open this on F1
map <F1> :vnew ~/.vimrc<CR>

" Toggle list on \tl and F2
nnoremap <leader>tl :set invlist list?<CR>
nmap <F2> <leader>tl
imap <F2> <C-O><leader>tl

" Line numbers on with F3
noremap <F3> :set nonumber!<CR>:set foldcolumn=0<CR>

" Toggle paste mode on \tp and F4
nnoremap <leader>tp :set invpaste paste?<CR>
nmap <F4> <leader>tp
imap <F4> <C-O><leader>tp
set pastetoggle=<F4>


" buffers - show with F5
noremap <F5> :ls!<CR>

" cross hairs on f5
nnoremap <leader>tc :set cursorline!<cr>:set cursorcolumn!<cr>
"nmap <F5> <leader>tc

"syntastic
nnoremap <F6> :Errors<cr>

" taglist.vim
nnoremap <silent> <F7> :TlistToggle<CR>

" registers - show with F6
"noremap <F6> :reg<CR>
" tags - show with F7
" not that useful!
" noremap <F7> :tags<CR>

" F7 gdiff
"nmap <F7> <leader>gd
"imap <F7> <C-O><leader>gd
"
" F8 gblame
nmap <F8> <leader>gb
"imap <F8> <C-O><leader>gb<cr>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"------------------
" Filetype specific settings
"------------------

"------------------
" PYTHON

" change tabstop width for python files
autocmd BufRead,BufNewFile *.py set tabstop=4
autocmd BufRead,BufNewFile *.py set shiftwidth=4

" don't want comments at the beginning of the line in python
" (not convinced these do anything due to the python indent plugin)
au BufNewFile,BufRead *.py set nocindent
au BufNewFile,BufRead *.py set nosmartindent
au BufNewFile,BufRead *.py set autoindent

" au BufNewFile,BufRead *.py set path+=~/gen_python/lib/geneity/lib,~/gen_python/lib/geneity/db

" project-specific
" au BufNewFile,BufRead *.py set path+=~/PROJ-Coral/sportsbook/apps/admin/python,~/PROJ-Coral/sportsbook/apps/ticker/python
" au BufNewFile,BufRead *.py set path+=~/PROJ-Coral/sportsbook/apps/python/sportsbook/placebet,~/PROJ-Coral/sportsbook/apps/python/sportsbook/settlement,~/PROJ-Coral/sportsbook/apps/python/sportsbook/admin

" abbreviations
au BufNewFile,BufRead *.py iab imp import
au BufNewFile,BufRead *.py iab esql odb.execute_sql
au BufNewFile,BufRead *.py iab esto odb.execute
au BufNewFile,BufRead *.py iab epro odb.execute_proc
au BufNewFile,BufRead *.py iab efun odb.execute_func
au BufNewFile,BufRead *.py iab importpdb import pdb; pdb.set_trace()

"------------------
" JAVASCRIPT

au BufNewFile,BufRead *.js iab fun function

let g:ctags_path='~/git/PROJ-Coral/coral/tags'
let g:ctags_statusline=1

"--------------------
"Python auto-complete
let g:pydiction_location='/home/sknox/.vim/ftplugin/python/complete-dict'

" NOTES
" :scriptnames - list all of the plugin/script files that have been loaded
" :verbose map <F6> list which file set the mapping F6
"
"
"
"
"
"
"
"" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"set sessionoptions+=resize,winpos

"autocmd VIMEnter * :source ~/.session.vim

"autocmd VIMLeave * :mksession! ~/.session.vim

if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif


" option name default optional ------------------------------------------------ 
" g:solarized_termcolors= 16 | 256 
" g:solarized_termtrans = 0 | 1 
" g:solarized_degrade = 0 | 1 
" g:solarized_bold = 1 | 0 
" g:solarized_underline = 1 | 0 
" g:solarized_italic = 1 | 0
" g:solarized_contrast = "normal"| "high" or "low" 
" g:solarized_visibility= "normal"| "high" or "low"
" ------------------------------------------------

:set cursorline cursorcolumn
let g:zenburn_unified_CursorColumn = 1
let g:zenburn_high_Contrast=0
let g:zenburn_alternate_Visual = 1
let g:zenburn_old_Visual = 0
let g:zenburn_enable_TagHighlight=1

colors zenburn

"#g:solarized_contrast = "high" 
"#g:solarized_visibility= "high"
"#colors solarized

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" Allow moving cursor past end of line in visual block mode:
set virtualedit+=block

" Keep search matches in the middle of the window:
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

let mapleader=","

nnoremap <leader><space> :noh<cr>

inoremap jj <ESC>


" don't hold onto old fugitive buffers http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
au BufReadPost fugitive://* set bufhidden=delete


" VUNDLE config: https://github.com/gmarik/vundle
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-unimpaired'
Bundle 'jnurmine/Zenburn'
Bundle 'eiginn/netrw'
" vim-scripts repos
Bundle 'taglist.vim'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" Bundle 'git://github.com/scrooloose/syntastic.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 "

" taglist vim config
"
" close if only tlist is open
let Tlist_Exit_OnlyWindow = 1

" close tags for inactive windows
let Tlist_File_Fold_Auto_Close = 1

" single click to select tag
" let Tlist_Use_SingleClick = 1

" taglist is a little too narrow ( default 30 )
let Tlist_WinWidth = 40

" gain focus when tlist is opened
let Tlist_GainFocus_On_ToggleOpen = 1

" display prototype
let Tlist_Display_Prototype = 1

" disable fold column (?)
let Tlist_Enable_Fold_Column = 1

" try make it update tags a little faster ( do not set in lower than 1 sec)
setlocal updatetime=4000

" use right window
let Tlist_Use_Right_Window = 0

" limit autocompletion scanning
set complete=.,w,b,u,t



"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


nnoremap <space> za

vnoremap <space> zf

set titleold=""
set titlestring=VIM:\%F


" match extra whitespace 
" show extra whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/
" :match ExtraWhitespace /\s\+$/ 
" don't show when im typing? 


let g:syntastic_python_checkers = ['pyflakes']
