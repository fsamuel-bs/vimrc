set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
nnoremap <leader>bi :BundleInstall<CR>
nnoremap <leader>bu :BundleInstall!<CR>

Bundle 'tpope/vim-fugitive'
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gdi :Gdiff
nnoremap <leader>ta :diffget //2<CR>
nnoremap <leader>me :diffget //3<CR>
nnoremap <leader>gci :Gcommit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gh :Gbrowse<CR>

autocmd BufReadPost fugitive://* set bufhidden=delete

Bundle 'tpope/vim-unimpaired'

Bundle 'tpope/vim-surround'

Bundle 'tpope/vim-repeat'

Bundle 'skammer/vim-css-color'

Bundle 'mutewinter/vim-indent-guides'

Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
"let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabMappingForward = "<c-space>"
let g:SuperTabMappingBackward = "<s-c-space>"

Bundle 'scrooloose/nerdcommenter'

Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore = ['^bin$','^build$','^target$','\~$']

Bundle 'jistr/vim-nerdtree-tabs'
map <Leader>n :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0

Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.git|\.hg|\.svn|build|bin)$',
\ 'file': '\.class$\|\.so$\|\.db$\|\.swp$',
\ }
" When in a git repository, only lists tracked files
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files && git ls-files --others --exclude-standard'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

" Creates a CtrlP tab for git modified files
Bundle 'jasoncodes/ctrlp-modified.vim'
map <Leader>m :CtrlPModified<CR>

Bundle 'majutsushi/tagbar'
set updatetime=500
map <leader>tb :TagbarToggle<CR>

" Snipmate with Dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

Bundle 'vim-ruby/vim-ruby'

Bundle 'skwp/vim-rspec'
nnoremap <leader>rs :RunSpec<CR>
nnoremap <leader>rl :RunSpecLine<CR>

" Close delimiters
Bundle 'Raimondi/delimitMate'

" Statusline utilities
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
let g:Powerline_symbols = 'unicode'

" Scala/SBT support with dependencies
Bundle 'rosstimson/scala-vim-support'
Bundle 'vim-scripts/tlib'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'MarcWeber/vim-addon-actions'
Bundle 'MarcWeber/vim-addon-sbt'

au BufRead,BufNewFile *.scala set filetype=scala
au BufRead,BufNewFile *.sbt set filetype=scala


" Handle VIM versionning easily
Bundle 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>
let g:gundo_close_on_revert = 1

Bundle 'xolox/vim-session'

Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['ruby', 'puppet', 'yaml', 'scala'],
      \ 'passive_filetypes': [] }

Bundle 'rodjek/vim-puppet'

Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/ruby-matchit'

" Themes
Bundle 'mrtazz/molokai.vim'

syn on " colored syntax

set number " line numbers
set clipboard=unnamedplus " tries to use system clipboard
set cursorline

if has("gui_running")
    colorscheme molokai
else
    colorscheme delek
endif

filetype plugin indent on

" keep pasted content in buffer
xnoremap p pgvy

" if a line wraps, 'j' and 'k' move through each visual line
noremap j gj
noremap k gk

" window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" window split change
nmap <leader>h <C-W>t <C-W>K
nmap <leader>v <C-W>t <C-W>H

" tab openning and closing
map <leader>tc :tabclose<CR>
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>

" tab navigation
if has("gui_running")
    nmap <C-Tab> gt
    nmap <C-S-Tab> gT
else
    nmap <Tab> gt
    nmap <S-Tab> gT
endif

" W also saves
command! W w

" Q also quits
command! Q q

" autocompletion with a menu
set wildmenu
set wildmode=list:longest,full

" Search options
set ignorecase
set smartcase " considers case when it is used, on the contrary don't
set incsearch " search while typing
set hlsearch "highlight all ocurrences of a pattern

" clean last search results
nnoremap <leader>lr <esc>:let @/ = ""<cr>:<esc>

" Java specifics
" Eclim
au FileType java map <leader>mi :JavaImportOrganize<cr>
au FileType java map <leader>co :JavaCorrect<cr>
au FileType java map <leader>fo :JavaFormat<cr>
au FileType java map <leader>gs :JavaGetSet<cr>
au FileType java map <leader>se :JavaSearch<cr>
au FileType java map <leader>jd :JavaDocComment<cr>

set tabstop=4 shiftwidth=4 softtabstop=4 backspace=indent,eol,start expandtab

" Scala indent with 2 spaces
au FileType scala set tabstop=2 shiftwidth=2 softtabstop=2
" Ruby indent with 2 spaces
au FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
" YAML indent with 2 spaces
au FileType yaml set tabstop=2 shiftwidth=2 softtabstop=2

if has("gui_running")
    " set guioptions-=T " turn off toolbar
    " set guioptions-=r " turn off right scrollbar
    " set guioptions-=l " turn off left scrollbar
    " set guioptions=m " turn on menu bar
    set guioptions= " turn off all
endif

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Disable home and end keys
map <home> <nop>
map <end> <nop>

" Display extra whitespace
set list listchars=tab:»…,trail:…

" Remove trailling white spaces on saving
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
au BufWrite * :call DeleteTrailingWS()

" Automatic folding
set foldmethod=syntax
set nofoldenable
nmap <SPACE> za

au BufNewFile,BufRead *.gradle setf groovy
au BufNewFile,BufRead *.json setf javascript
au BufNewFile,BufRead *.md setfiletype markdown
au BufNewFile,BufRead *.pp setfiletype puppet

" Resource .vimrc
nnoremap <leader>so :source ~/.vimrc<cr>
" Edit .vimrc
nnoremap <leader>rc :tabnew ~/vimrc/.vimrc<cr>

" Backup directory
set backupdir=~/.vim_bkp//
set directory=~/.vim_bkp//

" Highlighting lines longer than 80 columns
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/
