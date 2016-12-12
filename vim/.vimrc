""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""
set nocompatible
set number
set ruler
set hls
set showcmd
set incsearch

syntax on
"colorscheme biogoo
colorscheme desert
set laststatus=2

set autowrite
"Set to auto read when a file is changed from the outside
set autoread
set diffopt=vertical,iwhite
" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

autocmd BufWritePre *.cpp,*.c,*.cc,*.h,*.hh :%s/\s\+$//e

"set paste
"set ic
"set noic

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""
"INCIDENT SETTING
""""""""""""""""""""""""""""""""""""""
"use cindent stead of autoindent
"set autoindent shiftwidth=2
"set cindent shiftwidth=3 --CPP style
set cindent shiftwidth=4
set autoindent
"hitting Tab in insert mode will produce the appropriate number of spaces
set expandtab
set softtabstop=4
"set shiftwidth=4
"set tabstop=4

""""""""""""""""""""""""""""""""""""""
" Autocmd
""""""""""""""""""""""""""""""""""""""
"au[tocmd] syntax:
"au {event            }{pat}{ cmd                  }
"for example:
"au BufRead,BufNewFile *.tcl set filetype=eyonggutcl
au InsertEnter * hi StatusLine ctermbg=1 
au InsertLeave * hi StatusLine ctermbg=0

"au BufRead,BufNewFile /vobs/radio_testbeds_lte/* set expandtab
"au BufRead,BufNewFile /vobs/radio_testbeds_lte/* set shiftwidth=2
"au BufRead,BufNewFile /vobs/radio_testbeds_lte/* set tabstop=2
"au BufRead,BufNewFile ?akefile set noexpandtab
"au BufRead,BufNewFile ?akefile set shiftwidth=4
"au BufRead,BufNewFile ?akefile set tabstop=4

""""""""""""""""""""""""""""""""""""""
"BACKUP SETTING
""""""""""""""""""""""""""""""""""""""
"set backup
"set nobackup
"set backupext=.bak
"set nowritebackup
"set backupdir=~/tmp
"set backupcopy=yes

set viminfo='20,%1,f1,<500
"NOT save mapping and options
"set sessionoptions="buffers,curdir,folds,tabpages,winsize"

"Sets undo history size
set history=1000
"Persistent UNDO
if exists("&undodir")
    set undofile                " Save undo's after file closes
    set undodir=~/.vim/undo     " where to save undo histories
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif

""""""""""""""""""""""""""""""""""""""
"FOLD SETTING
""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldlevel=100

""""""""""""""""""""""""""""""""""""""
"KEY MAPPING
"It seems ALT+k is not portable
"Alt+k = Esc+k in putty
""""""""""""""""""""""""""""""""""""""
" map <silent><F5> :Tlist<CR>
" <F1> used by help
map <F1> :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%')<CR> :bo copen<CR>
map <F2> :cnext<CR>
map <F3> :cpre<CR>
"nmap <F4> :wa<Bar>if v:this_session != ""<Bar>exe "mksession! " . v:this_session<Bar>endif<CR>
map <F5> <Esc>:Tlist<CR>
map <F5> <Esc>:Tlist<CR>
" map <F6> :Lookup
map <F9> :bo cwindow<CR>
map <F10> :ccl<CR>
" map <F12> <Esc>:Tlist<CR><C-W>h<C-W>s<C-W>j5<C-W>-:VTreeExplore<CR>:set nonu<CR><C-W>l
" nmap <F12> :!/home/eyonggu/sbin/cs<CR>:cs reset<CR><CR>

"move
map <Space> <C-F>

"windows move
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-_> <C-w>_
map <C-=> <C-w>=

"save & close
" map <Esc>f :edit .<CR>jjjj
" fast close
map <C-c> :close<CR>
" fast save
map <Esc>s :w!<CR>
imap <Esc>s <Esc>:w!<CR>

"search & replace
"map <F3> :g/\<<C-R><C-W>\>/
map <Leader>s :%s/\<<C-R><C-W>\>/

nnoremap [I [I:let nr = input("Which one: ")<Bar>if nr != ""<Bar>exe "silent! normal " . nr ."[\t"<Bar>endif<CR>
nnoremap ]I ]I:let nr = input("Which one: ")<Bar>if nr != ""<Bar>exe "silent! normal " . nr ."]\t"<Bar>endif<CR>

"copy
vmap Y "+y
nmap P "+p
"copy between different vim instance
vmap xr c<Esc>:r $HOME/.vimxfer<CR>
vmap xw :w! $HOME/.vimxfer<CR>
nmap xr :r $HOME/.vimxfer<CR>
nmap xw :.w! $HOME/.vimxfer<CR>

"insert date
inoremap <Leader>dt  <C-R>=strftime("%Y-%m-%d")<CR>

""""""""""""""""""""""""""""""""""""""
"PLUGIN'S SETTING
""""""""""""""""""""""""""""""""""""""
"NERDTree
let NERDTreeWinPos = "right"
let NERDChristmasTree=0
"grep.vim
let Grep_Default_Filelist = '*.c *.cpp *.cc *.h *.hh'
"DoxygenToolkit.vim
let g:DoxygenToolkit_briefTag_pre = ""
"EnhCommentify
let EnhCommentifyRespectIndent = "yes"
let EnhCommentifyPretty = "yes"
"omnicppcomplete
" no preview windows
set completeopt=menuone
"ECHOFUNC
let g:EchoFuncKeyNext='<Leader>ef'
"LOOKUPFILE
" nmap <unique> <silent> lf <Plug>LookupFile
let g:LookupFile_TagExpr = string('./filenametags')
let g:LookupFile_MinPatLength = 2
let g:LookupFile_UsingSpecializedTags = 1
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'
"CSCOPE
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cst
set csto=0
if filereadable("cscope.out")
  cs add cscope.out
elseif filereadable("../cscope.out")
  cs add ../cscope.out
elseif filereadable("../../cscope.out")
  cs add ../../cscope.out
elseif filereadable("../../../cscope.out")
  cs add ../../../cscope.out
elseif filereadable("../../../../cscope.out")
  cs add ../../../../cscope.out
elseif filereadable("../../../../../cscope.out")
  cs add ../../../../../cscope.out
endif
set tags=./tags
"for Cygwin
set backspace=2
"PATHOGEN
call pathogen#infect()
"clang_complete
let g:clang_library_path = '/app/clang/3.1/LMWP3/lib'
"ultisnips
let g:UltiSnipsJumpForwardTrigger="<tab>"
"Ack
nnoremap <Leader>f :Ack <C-R><C-W> <CR>

""""""""""""""""""""""""""""""""""""""
"FUNCTION
"""""""""""""""""""""""""""""""""""""
"loookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$")+1, a:maxheight]), a:minheight]) . "wincmd _"
endfunction


""""""""""""""""""""""""""""""""""""""
"REGULAR TASKS
"""""""""""""""""""""""""""""""""""""
"list functions in current fpl file
nnoremap <Leader>fpl :vimgrep /^[^ ]*:$/ %<CR> :copen<CR>


""""""""""""""""""""""""""""""""""""""
"RCS code rule
"""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead /repo/eyonggu/rcs-*/* setlocal cindent shiftwidth=8 noexpandtab softtabstop=8 textwidth=79
