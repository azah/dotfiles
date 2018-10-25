if has('unix')
  set rtp+=/usr/bin/fzf
elseif has('macunix')
  set rtp+=/usr/local/opt/fzf
end

call plug#begin('~/.vim/plugged')

""" Langs
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elixir-editors/vim-elixir', { 'for': ['elixir'] }
Plug 'elorest/vim-slang', { 'for': 'slang' }
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'isobit/vim-caddyfile', { 'for': 'caddyfile' }
Plug 'ledger/vim-ledger'
Plug 'luochen1990/rainbow'
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'sheerun/vim-polyglot'

""" Vim behavior/functionality
Plug 'Yggdroot/indentLine', { 'for': ['yaml', 'python'] }
Plug 'bhurlow/vim-parinfer', {'for': ['clojure', 'lisp'] }
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides', { 'for': ['yaml', 'python', 'haml', 'slim', 'slang'] }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

""" Nice in theory, not sure if I'll actually use
Plug 'chrisbra/NrrwRgn', { 'on': 'NR' }
Plug 'gcmt/wildfire.vim', { 'for': ['clojure', 'lisp'] }
Plug 'gerw/vim-HiLinkTrace', { 'on': 'HLT!'}
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'radenling/vim-dispatch-neovim'
Plug 'skywind3000/asyncrun.vim', { 'on': ['AsyncRun'] }
Plug 'tpope/vim-dispatch'

call plug#end()
filetype plugin indent on
runtime macros/matchit.vim

syntax enable 
set hidden
set title
set history=1000

" theme / colors
set termguicolors
set background=dark
colorscheme gruvbox
set scrolloff=3

" Cursor position
set ruler
set rulerformat=%27(%{strftime('%a\ %e,\ %H:%M')}\ %5l,%-1(%c%V%)\ %P%)

set clipboard+=unnamedplus

" Line Numbers
set number

" make backspace behave
set backspace=eol,start,indent
set whichwrap+=<,>

set magic

set showmatch
set mat=2

" tab behavior
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab "paste correctly

" searching
set hlsearch "highlight search
set incsearch
set ignorecase " Ignore case when searching...
set smartcase  " Except when starting with a capital

" Quick timeouts on key combinations.
set timeoutlen=300

set shortmess=atIwmfl

" Backup, Swap, and Undo
set directory^=~/.nvim/tmp,/tmp
set backupdir=~/.nvim/backup,/tmp
set undodir=~/.nvim/undo,/tmp

" Remove swapfiles, autoread changes instead
set noswapfile
set autoread


"""
""" Variables for plugins
"""

" Rainbow brackets/parens
let g:rainbow_active = 1

let g:fzf_tags_command = 'ctags --extra=+f -R'

" gruvbox coloring for fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Disable arrow movement, resize splits instead.
let g:elite_mode = 1
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

" auto-ctags options
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']

let g:wildfire_objects = {
  \ "*" : ["i'", 'i"', "i)", "i]", "i}"],
  \ "html,xml" : ["at", "it"],
\ }
"for appending types to * rather than excluding: https://github.com/gcmt/wildfire.vim

let g:indentLine_char = '|'

""" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 1
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'rust': ['cargo'],
\ }

let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'grep']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"" ALE linters
let g:ale_fixers = {
\   'go'      :  ['gofmt'],
\   'rust'    :  ['rustfmt'],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1

"""
""" Key remapping
"""

" Leader key
let mapleader = ","

" ease of access
nnoremap ' `
nnoremap ` '

" Get out of insert mode with jj 
inoremap jj <Esc>

" Fast Saving
nmap <leader>w :w!<cr>

" Fast Save+Quit
nmap <leader>x :wq<cr>

" Fast quitting
nmap <leader>q :q!<cr>

" fast fuzzy searching
nmap <Leader>t :Tags<CR>
nmap <Leader>b :Buffers<CR>
nmap <c-p> :Files<cr>

" push window up/down
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" clear search highlight
nnoremap <Leader>co :nohl<CR><C-l>

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

" Tabularize
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>

" Save 1 keystroke on vim splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Allow mac copy/paste
vnoremap <C-x> :!pbcopy<CR>  
vnoremap <C-c> :w !pbcopy<CR><CR>

" Double leader key for toggling visual-line mode
nnoremap <silent> <Leader><Leader> V
vnoremap <Leader><Leader> <Esc>

" When pressing <leader>cd switch to the directory of the open buffer
nnoremap <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" Use backspace key for matchit.vim
nnoremap <BS> %
xnoremap <BS> %

" Session stuff
nnoremap <leader>ss :call MakeSession()<cr>
nnoremap <leader>sl :call LoadSession()<cr>

" Highlight syntax for word under cursor
nnoremap <leader>pr :HLT!<cr>

" In order to traverse ALE warnings
nnoremap [w <Plug>(ale_previous_wrap)
nnoremap ]w <Plug>(ale_next_wrap)

" Grepper
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
nnoremap gs <Plug>(GrepperOperator)
xnoremap gs <Plug>(GrepperOperator)

""" Syntaxes """

" Autoset slang syntax highlighting
au BufRead,BufNewFile *.slang set filetype=slang

" Autoset ecr -> erb syntax highlighting
au BufRead,BufNewFile *.ecr set filetype=erb

" Highlight syntax for word under cursor
nnoremap <leader>pr :HLT!<cr>

nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {

" Automatically make the dir if it doesn't exist on the machine.
silent !mkdir -p ~/.nvim/tmp >/dev/null 2>&1

" Autoread on common events
autocmd! FocusGained,BufEnter * checktime

tnoremap <Esc> <C-\><C-n>

" Clojure
" au Filetype clojure nmap <c-c><c-k> :Require<cr>  

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

set ssop-=options       " do not store options (vimrc) in a session
"" Make and load method to save session per dir
function! MakeSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
endfunction
function! LoadSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
    else
        echo "No session loaded."
    endif

endfunction

" Auto-commands 
augroup autosourcing
    if(argc() == 0)
        "au VimEnter * nested :call LoadSession() " Uncomment to automatically load session
        au VimLeave * :call MakeSession()
    endif
augroup END

"auto source nvimfile on write
augroup mynvimrc
    au!
    au BufWritePost ~/.config/nvim/init.vim so $MYVIMRC
augroup END

" FZF :Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
