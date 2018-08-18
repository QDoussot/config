set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jlanzarotta/bufexplorer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Indentation
set tabstop=4
set shiftwidth=4
set expandtab

"Highlighting
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

:highlight ERRORS ctermbg=red guibg=red
:highlight FAILURE ctermbg=red guibg=red
:match ERRORS /[a-zA-Z].*\[E\]/
:match FAILURE /[a-zA-Z].*\[FAILURE\]/

" Navigation
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-Tab> <C-W><C-W>

" Line wise navigation
" nnoremap <C-h> b
" nnoremap <C-l> e
nnoremap H ^
nnoremap L $
"
" Split
nnoremap <space>sv :vsplit<cr>
nnoremap <space>sh :split<cr>
nnoremap <space>sc :close<cr>

" Buffer
nnoremap <space>w :w<CR>
nnoremap <space>q :q<CR>
nnoremap <space>k :bp\|bd # <CR>
nnoremap <cr> :

nnoremap <space>n :bn<cr>

nnoremap <space>t <C-W>h:edit rake_display<cr>

" Execution
nnoremap <silent> <space>m :silent make<cr>:redr!<cr>
set showcmd
" set number
set background=dark
set t_Co=256
set path=**
set wildmenu

" Text modification
command! RemoveTrailingSpace :%s/\s*$//
nnoremap <space>rt :%s/\s*$//<cr>
" delete matching (braces etc..)
nnoremap <space>dm %%x<C-o>x


nnoremap <space>o O<ESC>

" Config File
command! Qconfig :edit $MYVIMRC
command! Qvconfig :edit ~/.vimrc
command! Qresource :source $MYVIMRC
command! Qmux :edit ~/.tmux.conf
nnoremap <space>ft t[y^<C-w>l:vimgrep "<C-r>"" **/*.rb<cr>

augroup on_save
    autocmd!
	autocmd BufWritePre * :silent !echo $(date -Is) % >> ~/.vimlogs
	autocmd BufWritePost $MYVIMRC :source $MYVIMRC
augroup END
