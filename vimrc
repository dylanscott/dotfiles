set shell=/bin/zsh
set nocompatible
syntax enable

filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off

" vim-plug
call plug#begin()
if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif
call plug#end()

filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>a :Ag<space>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" nnoremap <leader>q :cwindow<CR>
nnoremap <leader>c :noh<CR>
nnoremap <leader>d :VimFilerExplorer -toggle -auto-cd -winwidth=60<CR>
nnoremap <leader>f :VimFilerExplorer -find -auto-cd -winwidth=60<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>/ :Lines<CR>
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" YCM
nnoremap <leader>b :YcmCompleter GoToDefinition<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>r :YcmCompleter RefactorRename

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

augroup Misc
  autocmd!
  " md is markdown
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md set spell

  " automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =

  " remove trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

set nocursorline " don't highlight current line
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

let base16colorspace=256
set background=dark
colorscheme base16-ocean

set hlsearch

" airline / bufferline
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:bufferline_echo = 0

" make Esc happen without waiting for timeoutlen
" fixes Powerline delay
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

set hidden

" GUI
set guioptions-=L
set guioptions-=r
set guioptions-=e
set guifont=Hack:h14

" Custom mappings for the unite buffer
augroup Unite
  autocmd!
  autocmd FileType unite call s:unite_settings()
augroup END
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  " Quick exit unite buffers
  imap <buffer> <ESC>   <Plug>(unite_exit)
  nmap <buffer> <ESC>   <Plug>(unite_exit)
endfunction

" Vimfiler
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
      \ 'safe': 0,
      \ 'auto_cd': 1,
      \ 'explorer': 1
      \ })

nnoremap <C-W>o :MaximizerToggle<CR>

set autowrite

let g:localvimrc_whitelist='/Users/dscott/Code/ironclad.\?/.*'

" deoplete
let g:deoplete#enable_at_startup = 1
" don't complete in txt files
let g:deoplete#lock_buffer_name_pattern = '\v(\.md|\.txt|\.git\/COMMIT_EDITMSG)'

" neomake
augroup Neomake
  autocmd!
  autocmd! BufWritePost,BufReadPost * Neomake
augroup END
let g:neomake_open_list = 2 " open loclist on errors but preserve cursor pos

" disable builtin snippets
let g:neosnippet#disable_runtime_snippets = {
      \   '_' : 1,
      \ }
