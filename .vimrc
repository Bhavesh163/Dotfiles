" Leader key
let mapleader = " "

" Basic settings
set number relativenumber
set tabstop=2 shiftwidth=2 expandtab smartindent
set nowrap noswapfile nobackup
set undofile undodir=~/.vim/undo
set incsearch ignorecase smartcase
set termguicolors
set scrolloff=8 signcolumn=yes
set updatetime=50
set mouse=a
set clipboard=unnamedplus
set hidden
set splitright splitbelow
set wildmenu wildmode=longest:full,full
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'github/copilot.vim'
call plug#end()

" Create undo directory
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p", 0700)
endif

" Colorscheme
set background=dark
silent! colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" Disable error/warning highlighting
hi Error NONE
hi ErrorMsg NONE
hi WarningMsg NONE

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1

" Hide trailing whitespace markers
set nolist

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" FZF
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>

" Git
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git pull<CR>
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gb :Git blame<CR>

" CoC
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ca <Plug>(coc-codeaction)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Auto-format on save
autocmd BufWritePre *.py,*.js,*.ts,*.jsx,*.tsx,*.json,*.lua silent! call CocAction('format')

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Quick save/quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Clear search highlight
nnoremap <Esc> :noh<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Copy/paste
vnoremap <C-c> "+y
nnoremap <C-v> "+p
vnoremap <C-v> "+p

" Auto-close brackets
inoremap {<CR> {<CR>}<Esc>O

" Copilot
imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Cursor shape: block everywhere except insert (line)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[2 q"

" Auto-reload vimrc
autocmd BufWritePost .vimrc source %

" Fix cursor on exit
autocmd VimLeave * silent !echo -ne "\e[2 q"

" Status line (if airline fails)
if !exists('g:loaded_airline')
  set laststatus=2
  set statusline=%f\ %m%r%h%w\ [%{&ff}]\ %y\ %=%l,%c\ %p%%
endif
