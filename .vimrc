"==========================================================
" File: .vimrc
" Author: Xin Huang
" Date:
"==========================================================

" pathogen插件管理
execute pathogen#infect()

"============================
" General
"============================

" 关闭vi兼容模式
set nocompatible
" 文件修改之后自动载入
set autoread
" 启动时不显示那个援助索马里儿童的提示
set shortmess=atI
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 设置历史记录数
set history=1000 
" vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source %
set viminfo+=! " 保存全局变量
set linespace=0 " 字符间插入的像素行数目
set magic " 设置魔数
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割
set wildmenu " 增强模式中的命令行自动完成操作
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界
set report=0 " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读
set hidden " 允许在有未保存的修改时切换缓存区，此时的修改由Vim负责保存
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和Delete键删除回车符

" 取消自动备份
set noswapfile " 禁止生成临时文件
set nowb
set nobackup " 覆盖文件时不备份
set backupcopy=yes " 设置备份时的行为为覆盖

" 去掉输入错误的提示声音
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误响铃的终端代码
set tm=500

" 粘贴时保持格式
set paste

" 在所有模式下开启鼠标
set mouse-=a " 点击时光标位置不会发生变化，方便复制
set selection=exclusive
set selectmode=mouse,key

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启用自动补全
filetype plugin indent on

"============================
" Show & Format
"============================

set number " 显示行号
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
   autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
   autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
   autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o/*<ESC>'>o*/
   autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
   autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif " has("autocmd")
" 为方便复制，用<F2>开启/关闭行号显示
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" 括号配对
set showmatch " 高亮显示匹配的括号
set matchtime=2 " 匹配括号高亮的时间（单位是十分之一秒）

" 设置智能搜索提示
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set gdefault "行内替换

" 缩进
set autoindent " 自动缩进
set smartindent " 开启新行时使用智能自动缩进
set cindent " C系列缩进
set tabstop=2 " 设置Tab键的宽度为2
set softtabstop=2 " 使得按退格键时可以一次删掉2个空格
set shiftwidth=2 " 设定<<和>>命令移动时的宽度为2
"set noexpandtab " 不要用空格代替制表符
set expandtab " 设置用空格代替制表符
set smarttab " 在行和段开始处使用制表符

" 代码折叠
set foldenable " 开启折叠
" 折叠方法
" manual  手工折叠
" indent  使用缩进表示折叠
" expr    使用表达式语义定义折叠
" syntax  使用语法定义折叠
" diff    对没有更改的文本进行折叠
" maker   使用标记进行折叠，默认标记是 {{{ 和 }}}
set foldmethod=manual
set foldcolumn=4 " 在左侧显示折叠的层次
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开启折叠

"============================
" Status
"============================
" set ruler " 显示当前的行号和列号
set showcmd " 在状态栏显示正在输入的命令
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set cursorline " 突出当前显示行
set cmdheight=2 " 设置命令行的行数为2，默认是1
set laststatus=2 " 总是显示状态栏（默认是1，不显示）
" 设置状态栏显示信息（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%)

"============================
" Colors & Fonts
"============================

" 开启语法高亮
syntax enable
syntax on

" 设置配色方案
set background=dark
colorscheme solarized

"============================
" Encoding & Language
"============================

" 设置新建文件的编码为 UTF-8
"set fileencoding=utf8
" 自动判断编码时，依次尝试以下编码：
" (gb18130最好在UTF-8前面，否则其它编码的文件极可能被误识为UTF-8)
" set fileencodings=ucs-bom,utf-8,gb18130,default

" Use UNIX as the standard file type
set ffs=unix,dos,mac

" 支持中文
set enc=utf-8
set tenc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 如遇到Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 能够漂亮地显示.NFO文件
set encoding=utf-8
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

"============================
" Programming
"============================

" F5编译和运行C程序，F6编译和运行C++程序
" 请注意，下述代码在windows下使用会报错
" 需要去掉./这两个字符

" C的编译和运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc

" C++的编译和运行
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ -std=c++11 % -o %<"
exec "! ./%<"
endfunc

map <C-n> :NERDTree<CR>

" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  

set tags+=~/.vim/tags/cpp_src/tags " 设置tags搜索路径
set wildmode=longest,list " Ex命令自动补全采用bash方式

" taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type="name"

" omnicppcomplete
set completeopt=longest,menu
let OmniCpp_NamespaceSearch=1 " search namespaces in the current buffer and in included files
let OmniCpp_ShowPrototypeInAbbr=1 " 显示函数参数列表
let OmniCpp_MayCompleteScope=1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
