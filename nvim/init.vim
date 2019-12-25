
"source ~/.vim/.vimrc

" If you are using Neovim on Linux system and want to set it up system wide
" for users, set g:nvim_system_wide to 1. If you only want to use it for
" personal need, set this variable to 0.
let g:nvim_system_wide=0

" Do not set this varialbe if the system is not *nix
if g:nvim_system_wide
    if !has('unix')
        let g:nvim_system_wide = 0
    endif
endif

let g:nvim_config_root = expand('<sfile>:p:h')

" 为什么直接写set packpath+=g:nvim_config_root 不行呢?
set packpath+=~/.config/nvim
" set runtimepath+=~/.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto-install vim-plug on different systems if it does not exist.
" For Windows, only Windows 10 with curl installed are supported (after
" Windows 10 build 17063, source: http://tinyurl.com/y23972tt).
" The following script to install vim-plug is adapted from vim-plug
" wiki: https://github.com/junegunn/vim-plug/wiki/tips#tips
if !executable('curl')
    echomsg 'You have to install curl to install vim-plug. Or install '
                \ . 'vim-plug yourself following the guide on vim-plug git repo'
else
    let g:VIM_PLUG_PATH = expand(g:nvim_config_root . '/autoload/plug.vim')
    if empty(glob(g:VIM_PLUG_PATH))
        echomsg 'Installing Vim-plug on your system'
        silent execute '!curl -fLo ' . g:VIM_PLUG_PATH . ' --create-dirs '
                    \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        augroup plug_init
            autocmd!
            autocmd VimEnter * PlugInstall --sync | quit |source $MYVIMRC
        augroup END
    endif
endif

" Set up directory to install the plugins based on whether you are installing
" neovim system wide or for personal use.
if g:nvim_system_wide
    let g:PLUGIN_HOME="/usr/local/share/nvim/site"
else
    " 放到windows的user/USER_NAME/appdata/nvim-data目录不好
    " let g:PLUGIN_HOME=expand(stdpath('data') . '/plugged')

    " pluggin的目录使用~/.config/nvim/plugged
    let g:PLUGIN_HOME=g:nvim_config_root . '/plugged'
endif

" let g:PLUGIN_HOME = expand(g:nvim_config_root . '/plugged')

" nvim中没有"gui_running"
" 参考https://github.com/jdhao/nvim-config/blob/master/plugins.vim
if has('gui_running') || has('nvim')
  call plug#begin(g:PLUGIN_HOME)
  " call plug#begin(g:nvim_config_root . '/plugged')

  "{{ Text object plugins
  " Plugin to manipulate characer pairs quickly
  Plug 'tpope/vim-surround'

  " Add indent object for vim (useful for languages like Python)
  Plug 'michaeljsmith/vim-indent-object'
  "}}

  "{{ UI: Color, theme etc.
  " https://github.com/vim-airline/vim-airline,
  " 里面有很多其他好用的plugin可以参考.
  Plug 'vim-airline/vim-airline'

"  Plug 'lifepillar/vim-solarized8'
   Plug 'georgealbert/midnight2.vim'
  "}}

  "{{ Autocompletion related plugins
  " Insert mode completion
  Plug 'ervandew/supertab'
  "}}

  "{{ Navigation and tags plugin
  " File explorer for vim
  " Plug 'scrooloose/nerdtree', 'on': 'NERDTreeToggle'
  Plug 'scrooloose/nerdtree'

  " Only install these plugins if ctags are installed on the system
  if executable('ctags')
    " plugin to manage your tags
    " Plug 'ludovicchabant/vim-gutentags'
    " show file tags in vim window
    Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle', 'TagbarOpen'] }
  endif
  "}}

  "{{ File editting plugin
  " Automatic insertion and deletion of a pair of characters
  Plug 'jiangmiao/auto-pairs'

  " Comment plugin
  " [2019-12-25 周三 11:50:41] 感觉不如EnhCommentify.vim好用，不习惯
  " https://www.vim.org/scripts/script.php?script_id=23
  " Plug 'scrooloose/nerdcommenter'
  "}}

  " Plug 'vim-syntastic/syntastic'

  " Plug 'tpope/vim-markdown'
  " Plug 'lyuts/vim-rtags'
  " Plug 'vim-scripts/ctags.vim'

  " Plug 'vim-ctrlspace/vim-ctrlspace'
  " Plug 'tomtom/tcomment_vim'

  " Plug 'christoomey/vim-tmux-navigator'
  " Plug 'Yggdroot/indentLine'

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Coc is an intellisense engine for vim8 & neovim.
  " Intellisense engine for vim8 & neovim, full language server protocol
  "   support as VSCode
  " using lsp
  " https://github.com/neoclide/coc.nvim
  " Use release branch
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  call plug#end()
endif

filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme midnight2
colorscheme smyck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible
set autoindent
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview

" General tab settings
set tabstop=2     " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2  " number of spaces to use for autoindent
set expandtab     " expand tab to spaces so that tabs are spaces

" The level we start to fold
set foldlevel=9
set foldcolumn=0
set foldmethod=indent
set hidden

" The number of command and search history to keep
set history=1000

set hlsearch
set incsearch
set gdefault

" Show status bar by default.
set laststatus=2

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:+
" set list
" set listchars=trail:·

set modelines=5
set nobackup
set noeol
set nofoldenable

" Disable creating swapfiles, see https://goo.gl/FA6m6h
set noswapfile

" Show line number and relative line number
set number

set numberwidth=4

set ruler
set showcmd

set showmatch

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" disable spelling
set nospell

" Show hostname, full path of file and last-mod time on the window title.
" The meaning of the format str for strftime can be found in
" http://tinyurl.com/l9nuj4a. The function to get lastmod time is drawn from
" http://tinyurl.com/yxd23vo8

set title
" set titlestring=
" set titlestring+=%(%{hostname()}\ \ %)
" set titlestring+=%(%{expand('%:p')}\ \ %)
" set titlestring+=%{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent

" Do not show mode on command line since vim-airline can show it
set noshowmode

set wildmenu
set wildmode=list:longest

" Do not use visual and errorbells
" set visualbell noerrorbells
set visualbell

" Show current line where the cursor is
" 高亮光标所在的行
set cursorline


"set ttyfast
set textwidth=78
set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.gitkeep,.DS_Store
set textwidth=79
set formatoptions=n

" Set a ruler at column 81, see https://goo.gl/vEkF5i
set colorcolumn=81
set tw=79
set t_Co=256
set iskeyword-=_
" set linespace=0

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://goo.gl/YAHBbJ
set clipboard+=unnamedplus

if has("gui_running")
    set guioptions-=T " no toolbar
    set guioptions-=m " no menus
    set guioptions-=r " no scrollbar on the right
    set guioptions-=R " no scrollbar on the right
    set guioptions-=l " no scrollbar on the left
    set guioptions-=b " no scrollbar on the bottom
    set guioptions=aiA
    set mouse=v
endif

" [2019/12/20 9:47:39] neovim在ginit.vim中配置字体，不要用 set guifont
" set guifont=Bitstream\ Vera\ Sans\ Mono\ 16
" window中雅黑和Consolas比较好看.
"set guifont=Consolas-with-Yahei:h10
" set guifont=Ubuntu\ Mono:h12

" Autocommands depending on file type
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et
autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

syntax on

" --------
" MAPPINGS
" --------

" [2019/11/14 1:24:08] Press F5 to input time string.
nnoremap <F5> "=strftime("[%c]")<CR>P

" neovim的terminal mode, 2019.11.12
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-[> <Esc>
  " Switching between split windows:
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l

  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l

  " paste in terminal mode
  tnoremap <expr> <A-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
  tnoremap <S-Insert> <C-\><C-n>"+pi
endif

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" jump way
" nnoremap k gk
" nnoremap gk k
" nnoremap j gj
" nnoremap gj j

" imap jk <ESC>
" nnoremap ; :

" Search
" nmap <Space> /
"nnoremap / /\v
"vnoremap / /\v

" Clear search
nnoremap <leader><space> :noh<cr>

" Saving and buffer stuff
nmap <leader><ESC> :q!<CR>
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>

" Switch between / delete buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :bd<CR>
nmap <leader>D :bufdo bd<CR>

" Splits
nnoremap <leader>v :vs<CR> <C-w>l
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" Paste mode
set pastetoggle=<F2>

augroup term_settings
  autocmd!
  " Do not use number and relative number for terminal inside nvim
  autocmd TermOpen * setlocal norelativenumber nonumber
  " Go to insert mode by default to start typing command
  autocmd TermOpen * startinsert
augroup END

" Git blame
vmap <leader>gb :Gblame<CR>

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" ----------------
" PLUG-IN SETTINGS
" ----------------

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1

" Tabline settings
" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Show buffer number for easier switching between buffer,
" see https://github.com/vim-airline/vim-airline/issues/1149
let g:airline#extensions#tabline#buffer_nr_show = 1

" Buffer number display format
" 显示buffer id
let g:airline#extensions#tabline#buffer_nr_format = '%s. '

" Whether to show function or other tags on status line
" let g:airline#extensions#tagbar#enabled = 1

" Skip empty sections if there are nothing to show,
" extracted from https://vi.stackexchange.com/a/9637/15292
let g:airline_skip_empty_sections = 1

"  NERDtree
nmap <silent> <leader>p :NERDTreeToggle<cr>%


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use `[c` and `]c` to navigate diagnostics

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" 按<ESC>退出 coc-references
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
