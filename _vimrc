" ------------------------------
" Name: vimrc for windows
" Author: Muk
" ------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 隐藏GVIM菜单及设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 窗口大小
set lines=30 columns=100
" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright
"不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
" 使用内置 tab 样式而不是 gui
set guioptions-=e
set nolist
" 主题
colorscheme gruvbox
set background=dark

set clipboard=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ',' "定义<leader>键
set nocompatible    "设置不兼容原始vi模式
filetype on     "设置开启文件类型侦测
filetype plugin on  "加载对应文件类型插件
set noeb        "关闭错误提示
syntax enable       "开启语法高亮功能
syntax on       "自动语法高亮
set t_Co=256        "开启256色支持
set cmdheight=2     "设置命令行高度
set showcmd     "select模式下显示选中的行数
set ruler       "总是显示光标的位置
set laststatus=2    "总是显示状态栏
set number      "开启行号显示
set cursorline      "高亮显示当前行
set whichwrap+=<,>,h,l  "设置光标键跨行
set virtualedit=block,onemore   "允许光标出现在最后一个字符的后面
" 关闭警告
set vb t_vb=
au GuiEnter * set t_vb=

set t_Co=256
set  encoding=utf-8
set  fileencodings=ucs-bom,utf-8,cp936
set  fileencoding=gb2312
set  termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进与排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=DroidSansMono_Nerd_Font:h12
set linespace=4
set autoindent      "设置自动缩进
set cindent     "设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0 "设置使用C/C++语言的具体缩进方式
set smartindent     "智能选择对齐方式
filetype indent on  "自适应不同语言的智能缩进
set expandtab       "将制表符扩展为空格
set tabstop=2       "设置编辑时制表符所占的空格数
set shiftwidth=2    "设置格式化时制表符占用的空格数
set softtabstop=2       "设置2个空格为制表符
set smarttab        "在行和段开始处使用制表符
"set nowrap     "禁止折行
set backspace=2     "使用回车键正常处理indent.eol,start等

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu        "vim自身命令行模式智能补全
set completeopt-=preview    "补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax       "设置基于语法进行代码折叠
set nofoldenable            "关闭代码折叠

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 优化设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F1> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'javascript'
        exec '!node %'
    elseif &filetype == 'typescript'
        exec '!ts-node %'
    elseif &filetype == 'java'
        exec '!javac %'
        exec '!java %<'
    elseif &filetype == 'python'
        exec "!python3.6 %"
    elseif &filetype == 'sh'
        :!bash %
    endif
endfunc

"映射 esc 键为 jj
inoremap KL <Esc>
:nmap <c-s> :w<CR>
"快速打开vim配置文件：_vimrc
nnoremap <leader>e :e ~/_vimrc<cr>
"刷新配置
nnoremap <leader>r :source $MYVIMRC<cr>
" 插入模式、正常模式按 Ctrl+u 快速转换为大写
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe
"Ctrl+d 复制本行并粘贴到一下行
nnoremap <c-d> yyp

" <leader>+q 快速退出vim
nnoremap <leader>q :q<cr>
inoremap <leader>q <Esc>:q<cr>

" 添加“空格键”为代码折叠
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"若打开分割窗口，可快速切换窗口
"快捷键提示：Ctrl+w w 切换窗口; Ctrl+w s 水平分割; Ctrl+w v 竖直分割
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"buffer change
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>
nnoremap <leader>d :bd<cr>

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/')

  " === 语言支持 === "


  " == vim-airline == "
  Plugin 'vim-airline/vim-airline'
  "这个是安装字体后 必须设置此项" 
  let g:airline_powerline_fonts = 1   

  "打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1

  "设置切换Buffer快捷键"
  nnoremap <C-tab> :bn<CR>
  nnoremap <C-s-tab> :bp<CR>
  " 关闭状态显示空白符号计数
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline#extensions#whitespace#symbol = '!'
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_left_sep = '' 
  let g:airline_left_alt_sep = '' 
  let g:airline_right_sep = '' 
  let g:airline_right_alt_sep = '' 

  
  Plugin 'vim-airline/vim-airline-themes'
  let g:airline_theme='gruvbox'

  " == 自动闭合括号 == "
  Plugin 'jiangmiao/auto-pairs'

  " === HTML快速生成代码块 === "
  Plugin 'mattn/emmet-vim'
  let g:user_emmet_expandabbr_key = '<C-e>'
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,vue,jsx EmmetInstall

  Plugin 'alvan/vim-closetag'
  Plugin 'Yggdroot/indentLine'
  " GVim
  let g:indentLine_char = 'c'
  let g:indentLine_char_list = ['|', '¦', '┆', '┊']

  " 快速移动 "
  Plugin 'easymotion/vim-easymotion'

  " 缩进线 "

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'mhinz/vim-startify'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'junegunn/goyo.vim'
  

  " == 文件树 == "
  Plugin 'preservim/nerdtree'
  " nerdTree快捷键映射
  let NERDTreeWinPos='left'
  let NERDTreeWinSize=20
  " 不显示隐藏文件夹
  let g:NERDTreeHidden=0
  map <F2> :NERDTreeToggle<CR>

  " === 文件树显示git状态 "
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  let g:NERDTreeGitStatusIndicatorMapCustom = { 
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
  \ }
call vundle#end()
