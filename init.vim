call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.  plugin on GitHub repo
Plug 'bkad/CamelCaseMotion'
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fidian/hexmode'
Plug 'houl/vim-repmo'
Plug 'lervag/vimtex'
"Plug 'SirVer/ultisnips'
"Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mbbill/undotree'
Plug 'milkypostman/vim-togglelist'
Plug 'ronakg/quickr-cscope.vim'
Plug 'roxma/nvim-completion-manager'
    Plug 'Rip-Rip/clang_complete'
    "Plug 'sassanh/nvim-cm-eclim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'taketwo/vim-ros'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
"
" All of your Plugins must be added before the following line
call plug#end()            " required


"Vim Settings
set undofile
set undodir=~/.vim/undo
set noswapfile
set encoding=utf-8
"set tags=~/ctags/tags
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=
"set shell=bash\ -l
"set lazyredraw
colo molokai
set number
set cursorline
set ruler
set nowrap
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
"set wildmenu
"set wildmode=longest,full
"set wildignore=.svn,CVS,.git,tmp,*.o,*~,*.pyc,*.d,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam
set hlsearch
set ignorecase
set smartcase
set hidden
set foldenable
set foldlevel=10
syn region myFold start="\#IF" end="\#ENDIF" transparent fold
set foldmethod=syntax
let g:xml_syntax_folding =1
set incsearch
set noequalalways
set splitbelow
set splitright
set timeoutlen=300
set ttimeoutlen=1000
set visualbell
set csre
set t_vb=
set diffopt=filler,vertical,context:1000,iwhite
set cscopetag
set mouse=a

let g:tex_conceal=""
""autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch

"call yankstack#setup()
""
""Mappings
autocmd CmdwinEnter * nnoremap <CR> <CR>
nnoremap <S-Enter> o<Esc>
inoremap kj <Esc>
nnoremap <CR> <cr>O<Esc>
noremap ~? ~/
noremap / /\v
map Y y$
nnoremap <S-L> :nohl<CR>
"nnoremap B ^
"nnoremap E $
nnoremap S "_diwP
nnoremap J j
nnoremap <silent>JJ :join<CR>
nnoremap S "_diwP

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <A-l> :bn<CR>
nnoremap <A-h> :bp<CR>
nnoremap <A-j> :b#<CR>

onoremap " i"
onoremap ( i(

cnoremap :ex<CR> :Ex<CR>
""nmap <space> i<space><esc>
""
""make tabbing indent and outdent in all modes
"""broken?
    nnoremap <Tab> >>
    nnoremap <S-Tab> <<_
    inoremap <S-Tab> <C-D>
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv
    "nnoremap <C-i> <Tab>

autocmd TextYankPost  * :set norelativenumber
nnoremap <silent><expr>d ':set relativenumber<CR>"'.v:register.'d'
nnoremap <silent><expr>y ':set relativenumber<CR>"'.v:register.'y'
onoremap <ESC> set norelativenumber<ESC>

nnoremap <silent><leader>w :call ToggleWrap()<CR>

""terminal mode remaps
autocmd WinEnter term://* startinsert
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <A-l> <C-\><C-n>:bn<CR>
tnoremap <A-h> <C-\><C-n>:bp<CR>
tnoremap <A-j> <C-\><C-n>:b#<CR>
tnoremap <Esc> <C-\><C-n>

""noremap <F3> :YcmForceCompileAndDiagnostics<CR>
noremap <F4> :ALEFix<CR>
noremap <F5> :UndotreeToggle<CR>
noremap <F6> :cd %:p:h<CR> :pwd <CR>
noremap <F7> :NERDTreeToggle<CR>
noremap <F8> :TagbarToggle<CR>
noremap <F9> :so $MYVIMRC<CR>
noremap <F10> :redraw!<CR>
"noremap <F11> :e ~/.bashrc<CR>
noremap <F12> :e $MYVIMRC<CR>

""Functions

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfunction
command! TrimWhitespace call TrimWhitespace()

function! ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        setlocal nolbr
        set virtualedit=
        silent! nunmap <buffer> j
        silent! nunmap <buffer> k
        silent! ounmap <buffer> j
        silent! ounmap <buffer> k
    else
        echo "Wrap ON"
        setlocal wrap
        setlocal lbr
        set virtualedit=all
        noremap  <buffer> <silent> k gk
        noremap  <buffer> <silent> j gj
        onoremap  <buffer> <silent> k gk
        onoremap  <buffer> <silent> j gj
    endif
endfunction

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
"autocmd FileChangedShellPost * \/ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

""Plugin Options""

"csv
let g:csv_strict_columns = 1
let g:csv_no_column_highlight = 1
let g:csv_disable_fdt = 0
autocmd BufRead,BufNewFile *.csv :1,$ ArrangeColumn!
autocmd BufWritePre,FileWritePre *.csv :1,$UnArrangeColumn
autocmd BufWritePost,FileWritePost *.csv :1,$ArrangeColumn!

""Quickfix and Location window settings
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>:cclose<CR>
nnoremap <leader> q :copen<CR>
nnoremap [q :cp<CR>
nnoremap ]q :cn<CR>
let g:toggle_list_copen_command=":bo copen"

""File Explorer Settings
let g:NERDTreeQuitOnOpen=1
let g:netrw_sort_options="i"
let g:netrw_sort_sequence=""
let NERDTreeIgnore = ['\.pyc$']

""indentLine settings
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_enabled = 1
let g:indentLine_color_term = 237
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*,t\/\/.*bash']
"let g:indentLine_concealcursor = 'vc'
"let g:indentLine_conceallevel = 0

""CtrlP settings
""let g:ctrlp_cmd =
"let g:ctrlp_by_filename = 1
""let g:ctrlp_custom_ignore =
"let g:ctrlp_lazy_update = 1

""BufferLine settings
"let g:bufferline_echo = 0
"let g:rainbow_active = 0

"CamelCaseMotion Settings
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
omap iw <Plug>CamelCaseMotion_iw
xmap iw <Plug>CamelCaseMotion_iw
omap ib <Plug>CamelCaseMotion_ib
xmap ib <Plug>CamelCaseMotion_ib
omap ie <Plug>CamelCaseMotion_ie
xmap ie <Plug>CamelCaseMotion_ie

""undo settings
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenvToggle = 1
let g:undotree_TreeNodeShape = '*'

""Airline Settings
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"nmap <leader>- <Plug>AirlineSelectPrevTab
"nmap <leader>+ <Plug>AirlineSelectNextTab

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

"" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-n>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"nvim-completion settings
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"ALE
let g:ale_lint_on_save =0
let g:ale_fixers = {
\            'python':['autopep8'],
\            'xml':['xmllint']
\}

let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_autopep8_options = '--aggressive --max-line-length=120'

"NERDComment
let g:NERDCreateDefaultMappings = 0
nmap <leader><space> <plug>NERDCommenterToggle
vmap <leader><space> <plug>NERDCommenterToggle

"let g:ycm_global_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
"let g:ycm_always_populate_location_list = 1
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"let g:ycm_autoclose_preview_window_after_insertion = 1

"nmap <leader>p <Plug>yankstack_substitute_older_paste
"nmap <leader>P <Plug>yankstack_substitute_newer_paste
"
cd ~
let g:python3_host_prog='C:\Users\Matthew\AppData\Local\Programs\Python\Python36\python.exe'
"let g:python_host_prog='C:/Users/foo/Envs/neovim/Scripts/python.exe'
