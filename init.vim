let g:indent_guides_guide_size = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进
let g:indentLine_fileTypeExclude = ['dashboard']

let g:coc_disable_startup_warning = 1

let mapleader=" "

call plug#begin('~/.config/nvim/.vim/plugged')
" 语法高亮
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" vim-pink-moon
Plug 'sts10/vim-pink-moon'

" zephyrium
Plug 'titanzero/zephyrium'

" yowish
Plug 'KabbAmine/yowish.vim'

" 菜单栏美化
if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" 突出光标词
Plug 'itchyny/vim-cursorword'

" quick run core
Plug 'thinca/vim-quickrun'

" 快速对齐
Plug 'junegunn/vim-easy-align'

" easymotion
Plug 'easymotion/vim-easymotion'

" auto pairs
Plug 'jiangmiao/auto-pairs' 

" 预览文件树
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" star view
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" bufferline
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'lambdalisue/nerdfont.vim'
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim'

" gruvbox
Plug 'morhetz/gruvbox'
"Plug 'ellisonleao/gruvbox.nvim'

" lightline 
Plug 'itchyny/lightline.vim'

" nord-vim
Plug 'arcticicestudio/nord-vim'

" vim-one theme
Plug 'rakr/vim-one'

" monokai theme
Plug 'crusoexia/vim-monokai'

" gruvbox theme
Plug 'sainnhe/gruvbox-material'

" theme inkstained-vim
Plug 'yuttie/inkstained-vim'

" theme hydrangea-vim
Plug 'yuttie/hydrangea-vim'

"auto save
Plug 'Pocco81/AutoSave.nvim'

"show loading thime
Plug 'dstein64/vim-startuptime'

" rust invspring 
Plug 'rust-lang/rust.vim'


" smooth slide
Plug 'karb94/neoscroll.nvim'

" 缩进线
Plug 'Yggdroot/indentLine'

" 底下标签
"Plug 'vim-airline/vim-airline'       
"Plug 'vim-airline/vim-airline-themes' "airline 的主题

" 显示代码结构
Plug 'liuchengxu/vista.vim'

" 注释工具 
Plug 'scrooloose/nerdcommenter'

" 分割窗口
Plug 'vimlab/split-term.vim' 
"Plug 'akinsho/toggleterm.nvim'
Plug 'numToStr/FTerm.nvim'
"Plug 'voldikss/vim-floaterm'


" 文件树 
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" 彩虹括号
Plug 'luochen1990/rainbow'
" ctag 辅助
Plug 'majutsushi/tagbar'
" cpp 增强
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/TaskList.vim'
call plug#end()

" -----------------------------
"
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

lua << EOF
require'FTerm'.setup({
    border = 'double',
    hl = 'Normal',
    blend = 0;
    dimensions  = {
        height = 0.9,
        width = 0.8,
        x = 0.5,
        y = 0.3,
    },
})

-- Example keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
EOF


" 显示代码结构
let g:tagbar_width=30
nnoremap <silent> <F1> :TagbarToggle<CR> " 将tagbar的开关按键设置为 F1

" 分割窗口
let g:split_term_default_shell = "zsh"

" 快速对齐
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" demo : https://github.com/junegunn/vim-easy-align


" 'border'            : 'single', 'double', 'rounded' or 'solid'
"                     : can also be a list of 8 characters
" 'highlights.border' : highlight to use for the border`
" Key bindings can be changed, see below
call wilder#setup({'modes': [':', '/', '?']}) 
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \ },
      \ 'border': 'rounded',
      \ })))



" dashboard settings
" Default value is clap
let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header =<< trim END
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``'
END
"let g:dashboard_custom_header = [
"\ '                                                       ', 
"\ '                                                       ', 
"\ '                                                       ', 
"\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
"\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
"\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
"\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
"\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
"\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
"\ '                                                       ', 
"\ '                                                       ', 
"\]
"eg : "SPC mean the leaderkey
let g:mapleader="\<Space>"
let g:dashboard_default_executive ='telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" telescope settings
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" bufferline settings
" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF
"hi Normal ctermfg=252 ctermbg=none

"colorscheme gruvbox-material
"set termguicolors
"set background = dark
colorscheme gruvbox
set background=dark
highlight Normal guibg=NONE ctermbg=None
"hi! Normal ctermfg=NONE ctermbg=NONE guibg=NONE
"hi! NonText  ctermfg=NONE ctermbg=NONE guibg=NONE 
hi! NormalFloat  ctermfg=NONE ctermbg=NONE guibg=NONE 
hi! Pmenu  ctermfg=NONE ctermbg=NONE guibg=NONE 
"hi! EndOfBuffer  ctermfg=NONE ctermbg=NONE guibg=NONE 
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

let b:coc_pairs_disabled = ['<']
let g:vimspector_enable_mappings = 'HUMAN'

" nvim-tree
lua <<EOF
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
EOF
nnoremap <F2> :NvimTreeToggle<CR>

" if hidden is not set, textedit might fail.
set hidden
" some servers have issues with backup files, see #649
set nobackup
set nowritebackup
 
" you will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
 
" don't give |ins-completion-menu| messages.
set shortmess+=c
 
" always show signcolumns
set signcolumn=yes
 
" use tab for trigger completion with characters ahead and navigate.
" use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
 
" use <cr> to confirm completion, `<c-g>u` means break undo chain at current position.
" coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<c-y>" : "\<c-g>u\<cr>"
 
" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)
" remap keys for gotos
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
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
 
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
 
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
 
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

filetype plugin on
" 设置为双字宽显示，否则无法完整显示如:☆
" set ambiwidth=double

set t_ut= " 防止vim背景颜色错误
set relativenumber "相对行号
set showmatch " 高亮匹配括号
set cursorline "高亮所在行
set wrap "设置换行
set showcmd "设置按下的键
set nobackup "不需要备份文件
set matchtime=1
set report=0
set ignorecase
set nocompatible
set noeb
set smartindent
set tabstop=4 "设置TAB宽度
set softtabstop=4
set shiftwidth=4
set expandtab
set nobackup
set autoread
set nocompatible
set nu "设置显示行号
set backspace=2 "能使用backspace回删
syntax on "语法检测
set ruler "显示最后一行的状态
set laststatus=2 "两行状态行+一行命令行
set ts=4
set autoindent "设置c语言自动对齐
set t_Co=256 "指定配色方案为256
set mouse=a "设置可以在VIM使用鼠标
set selection=exclusive
set selectmode=mouse,key
set history=1000 "设置历史记录条数   
" 配色方案
" let g:seoul256_background = 234
set shortmess=atl
"ssh 远程粘贴板
"if executable('clipboard-provider')
    "let g:clipboard = {
          "\ 'name': 'myClipboard',
          "\     'copy': {
          "\         '+': 'clipboard-provider copy',
          "\         '*': 'env COPY_PROVIDERS=tmux clipboard-provider copy',
          "\     },
          "\     'paste': {
          "\         '+': 'clipboard-provider paste',
          "\         '*': 'env COPY_PROVIDERS=tmux clipboard-provider paste',
          "\     },
          "\ }
"endif
"共享剪切板
"set clipboard+=unnamed 
set cmdheight=3
set helplang=cn
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set updatetime=300
set shortmess+=c
set signcolumn=yes
set modifiable
noremap = nzz
noremap - Nzz
 
" autocmd FileType json syntax match Comment +\/\/.\+$+
 
set foldmethod=indent " 设置默认折叠方式为缩进
set foldlevelstart=99 " 每次打开文件时关闭折叠
 
" hi Normal ctermbg=none
" au FileType gitcommit,gitrebase let g:gutentags_enabled=0
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" neoscroll
lua << EOF
require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,        -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,              -- Function to run after the scrolling animation ends
})
EOF

" === rust.vim 配置 ===
syntax enable
filetype plugin indent on
" 保存时代码自动格式化
let g:rustfmt_autosave = 0

" 手动调用格式化， Visual 模式下局部格式化，Normal 模式下当前文件内容格式化
" 有时候代码有错误时，rust.vim 不会调用格式化，手动格式化就很方便
vnoremap <leader>ft :RustFmtRange<CR>
nnoremap <leader>ft :RustFmt<CR>
" 设置编译运行 (来自 rust.vim，加命令行参数则使用命令 `:RustRun!`)
nnoremap <A-r> :RustRun<CR>
" 使用 `:verbose nmap <M-t>` 检测 Alt-t是否被占用
" 使用 `:verbose nmap` 则显示所有快捷键绑定信息
nnoremap <A-t> :RustTest<CR>

lua << EOF
local autosave = require("autosave")
autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
EOF


" self settings
inoremap jk <Esc> "将jk映射到Esc

"inoremap <c-> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

noremap <C-s> :w<CR>
noremap Q ZZ
noremap R :bufdo e <CR>
" 注释
map <leader>. <leader>c<leader> 
" wsl 与 win 剪贴板
map <leader>y :!clip.exe < %<CR>
" 查看详细
map <C-insert> gd
map <C-delete> :bd<CR>
" 切换buffer
map <a-h> :bp<CR>
map <a-l> :bn<CR>
" 取消搜索
map <Esc> :nohl<CR>
" 行头 行尾
noremap H 0
noremap L $

autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

" 快速编译
map <F7> :call RunPython()<CR>
fun! RunPython()
    exec "w"
    if &filetype=='python'
        exec "!time python3 %"
    elseif &filetype=='cpp'
        exec "make"
    endif
endfunc
map <leader>9 :Cargo run<CR>
map <leader>0 :make clean<CR>

"创建文件头
autocmd BufNewFile *.py,*.tex exec ":call SetTitle()"
func! SetTitle() 
    if &filetype == 'python'
        call setline(1,"#!/usr/bin/env python3")
        call append(line("."),"# -*- coding:UTF-8 -*-")
        call append(line(".")+1,"##########################################################################")
        call append(line(".")+2, "# File Name: ".expand("%"))
        call append(line(".")+3, "# Author: stubborn vegeta")
        call append(line(".")+4, "# Created Time: ".strftime("%c"))
        call append(line(".")+5, "##########################################################################")
    endif
    normal Go 
endfunc

