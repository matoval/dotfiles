call plug#begin('~/.vim/plugged')
    " gruvbox color scheme
    Plug 'gruvbox-community/gruvbox'
    " collection of language syntax packs 
    Plug 'sheerun/vim-polyglot'
    " LSP, Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " File search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " lightline for vim statusline
    Plug 'itchyny/lightline.vim'
    " snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " File viewer
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'itchyny/vim-gitbranch'
call plug#end()

colorscheme gruvbox "sets colorscheme on bootup

set background=dark

" lightline config
let g:lightline = {
        \ 'colorscheme': 'gruvbox',
      \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
      \             [ 'githunks', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
        \   'gitbranch': 'gitbranch#name',
        \   'githunks': 'GitStatus' 
      \ },
      \ }

" Remap for vim windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Show line numbers
set number

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" remove arrow keys - all modes
" noremap  <Up> ""
" noremap! <Up> <Esc>
" noremap  <Down> ""
" noremap! <Down> <Esc>
" noremap  <Left> ""
" noremap! <Left> <Esc>
" noremap  <Right> ""
" noremap! <Right> <Esc>

" Remap for FZF
nnoremap <C-f> :Files<CR>

" Auto enable GitGutter
let g:gitgutter_enabled = 1

" Add git staus to status line
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
