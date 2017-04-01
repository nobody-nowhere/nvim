source ~/.config/nvim/plug.vim
source ~/.config/nvim/plugs.vim

set cindent

" Now we set some defaults for the editor
set history=50					" keep 50 lines of command line history
" set ruler						" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line
set complete-=1
" set shada=""
set undofile
set undodir=~/.local/share/nvim/undo

" Protect large files from sourcing and other overhead.
if !exists("my_auto_commands_loaded")
	let my_auto_commands_loaded = 1

	" eventignore+=FileType (no syntax highlighting etc
	" assumes FileType always on)
	" noswapfile (save copy of file)
	" bufhidden=unload (save memory when other file is viewed)
	" buftype=nowrite (file is read-only)
	" undolevels=-1 (no undo possible)
	let g:LargeFile = 1024 * 1024 * 20
	augroup LargeFile
		autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload undolevels=-1 | else | set eventignore-=FileType | endif
	augroup END
endif

" autocmd FileType cpp set keywordprg=cppman

" set ttimeout		" time out for key codes
" set ttimeoutlen=10	" wait up to 100ms after Esc for special key
" set cursorline

"set noshowmode
set ts=4
set shiftwidth=4
set softtabstop=4
set lazyredraw
" set rnu
" set nuw=3
set scrolloff=3

set title
set regexpengine=1

" syntax on

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" if has('mouse')
	set mouse=v
" endif

" Do incremental searching when it's possible to timeout
if has('reltime')
	set incsearch
	set hlsearch
endif

" I like highlighting strings inside C comments.
" Revert with ":unlet c_comment_strings".
let c_comment_strings=1

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	" Revert with ":filetype off".
	filetype plugin indent on
	" Put these in an autocmd group, so that you can revert them with:
	" ":augroup vimStartup | au! | augroup END"
	augroup vimStartup
	au!

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") |   exe "normal! g`\"" | endif
	augroup END
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

if has('gui_running')
" Make shift-insert work like in Xterm
	map <S-Insert> <MiddleMouse>
	map! <S-Insert> <MiddleMouse>
endif

" KEY MAPPINGS
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

cmap w!! w !sudo tee % >/dev/null

nnoremap j gj
nnoremap k gk

" SPACE IS THE LEADER!
map <Space> <Leader>
map <Leader>o @o
map <Leader>p @p
map <Leader>i @i

" Quick copy-paste
vmap <Leader>y "+y
vmap <Leader>Y "+Y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" vmap r "_dP
" vmap <Leader>r "_d"+P

" Don't use Ex mode, use Q to quit
" Revert with ":unmap Q", ":unmap q:"
map Q <NOP>
map <expr> <Leader>q &mod ? ':qa!' : ':q<CR>'
"map q: :q<CR>

map <Leader>` :w<CR>
map <Leader>w <C-w>
map <Leader>d :w<CR>:terminal<CR>
map <F5> :w<CR>:Neomake!<CR><CR>
map <F6> :w<CR>:Neomake!<Space>debug<CR>:terminal<Space>gdb<Space>./%.out<CR><CR>
map <F9> :w<CR>:terminal<Space>./%.out<CR>
map <Leader>z ZZ
nnoremap <CR> <NOP>

noremap ' `
map ` <ESC>

map <Leader><C-j> $x

" CTRL-U in insert mode deletes a lot.	Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

source ~/.config/nvim/interface.vim
