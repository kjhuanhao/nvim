
" Huanhao 's vimrc
"  __  ____   __  _   ___     _____ __  __ ____   ____
" |  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
" | |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
" |_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: Huanhao
" Github: kjhuanhao

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent ! exec "!mkdir ~/.config/nvim/autoload/"
	silent ! exec "!wget https://cdn.jsdelivr.net/gh/junegunn/vim-plug/plug.vim ~/.config/nvim/autoload/"
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===

" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location

" ===

let has_machine_specific_file = 1

if empty(glob('~/.config/nvim/_machine_specific.vim'))

	let has_machine_specific_file = 0

	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"

endif

source ~/.config/nvim/_machine_specific.vim


"===
"=== System
"===
let &t_ut=''
set autochdir
set nocompatible

"===
"=== Editor behaviour
"===
set number "show line
set hlsearch
set incsearch
set ignorecase "search ignores case
set enc=utf-8 "coding
set cursorline "The current line displays line
set wrap "Word wrap
set showcmd
set wildmenu "completion
set scrolloff=5
set list
set listchars=tab:▸\   ",trail:▫
set nospell
set showmatch
set matchtime=1
setlocal noswapfile
set bufhidden=hide
set autoread
"Go back to the last edit
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"file type
filetype on
filetype plugin on
filetype indent on

" ===
" === Basic Mappings
" ===
let mapleader=" "
"Save & quit
map s <nop>
map S :w<CR>
map Q :q<CR>

"Overloading nvim
map R :source ~/.config/nvim/init.vim<CR>

" Undo operations
nnoremap L u

"Search
noremap <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y



" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < h   k >
"     j
"     v
nnoremap <silent> u k
nnoremap <silent> k l
vnoremap <silent>> u k
vnoremap <silent>> k l

" U/E keys for 5 times u/e (faster navigation)
noremap <silent>U 5k
noremap <silent>J 5j

" N key: go to the start of the line
noremap <silent> 9 0
" I key: go to the end of the line
noremap <silent> 0 $


" ===
" === Window management
" ===
" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>


" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map su :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sk :set splitright<CR>:vsplit<CR>

" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER><up> <C-w><up>
map <LEADER><down> <C-w><down>

map <LEADER><left> <C-w><left>
map <LEADER><right> <C-w><right>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tl :-tabnext<CR>  " last
noremap tn :+tabnext<CR>  " next
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>


" ===
" === markdown settings
" ===
" snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
"autocmd bufread,bufnewfile *.md setlocal spell
" press space twice to jump to the next '<++>' and edit it
noremap <leader><leader> <esc>/<++><cr>:nohlsearch<cr>c4l


" ===

" === Compile function

" ===

noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype== "yaml"
		exec "!hexo s" 
	endif
endfunc


" ===================== Install Plugins with Vim-Plug =====================

call plug#begin('~/.config/nvim/plugged')

"==start=="
Plug 'mhinz/vim-startify'


"==Beautify my vim=="
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-dark'


"==File=="
Plug 'preservim/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'

"==completion=="
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'ycm-core/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"==Markdown=="
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

"==commentary=="
Plug 'tpope/vim-commentary'


call plug#end()



" ===================== Start of Plugin Settings =====================

" ===

" === NERDTree

" ===
map tt :NERDTreeToggle<CR>

" ===

" === NERDTree-git

" ===
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ===

" === Dress my nvim

" ===

set termguicolors     " enable true colors support
colorscheme space-vim-dark
hi Comment cterm=italic
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" ===

" === YouCompleteMe

" ===
"let g:ycm_global_ycm_extra_conf= '$HOME/.config/nvim/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_complete_in_comments = 1
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_cache_omnifunc=0
"let g:ycm_complete_in_strings = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"set completeopt=longest,menu



" ===

" === coc

" ===

" ===
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-tslint', 'coc-lists', 'coc-git', 'coc-explorer', 'coc-pyright', 'coc-sourcekit', 'coc-translator', 'coc-flutter', 'coc-todolist', 'coc-yaml', 'coc-tasks', 'coc-actions', 'coc-diagnostic']
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> T :CocList tasks<CR>


" === MarkdownPreview

" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 1
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1
			\ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

noremap mp :MarkdownPreview
noremap tm :TableModeToggle

" ===

" === NERDTree-git

" ===
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===

" === easymotion

" ===
map ss <Plug>(easymotion-s2)

" ===

" === Ctrlp

" ===
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 'et'


" ===

" === ultisnips

" ===
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>

" ===================== End of Plugin Settings =====================


" Open the _machine_specific.vim file if it has just been created

if has_machine_specific_file == 0

	exec "e ~/.config/nvim/_machine_specific.vim"
endif

