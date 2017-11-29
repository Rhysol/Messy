" Base Config " {{{
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" }}}

" Command Config " {{{
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
map h <UP>
map j <LEFT>
map k <DOWN>
map l <RIGHT>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>jw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>hw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>kw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
" 设置折叠方法为marker
nmap <Leader><Leader>fm :set foldmethod=marker<CR>
" }}}

" 代码分析 " {{{
" 语法高亮 " {{{
" 开启语法高亮功能
"syntax enable
" 允许用指定语法高亮配色方案替换默认方案
"syntax on
" }}}
" 代码缩进 " {{{
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
" 色块宽度
"let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" }}}
" 接口与实现快速切换 " {{{
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
" }}}
" }}}

" 代码开发 " {{{
" 模板补全 " {{{
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" }}}
" 智能补全 " {{{
" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全          
let g:ycm_seed_identifiers_with_syntax=1
" }}}
" }}}

" Apperance " {{{
" colorScheme
"set background=dark
"colorscheme solarized8_dark_flat
"sotp cursor blinking
set gcr=a:block-blinkon0
" delete tool bar
set guioptions-=T
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 设置 gvim 显示字体
set guifont=Consolas:h11
" 禁止折行
set nowrap
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
" }}}

" Plugin " {{{

" Vundle " {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on
" }}}

" }}}
