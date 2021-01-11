" .vimrc - Vim configuration file Only for personal use.
"
" ---------------------------------------------------------
"  GENERAL SETTINGS
" ---------------------------------------------------------
" GENERAL: Globle General Settings {{{1
filetype plugin indent on        "自动缩进 :h filetype
syntax on                        "语法高亮 :h syntax
set   t_Co=256                   "颜色数目
set   autoindent                 "开启新行时从当前行复制缩进距离
set   autoread                   "Vim 之外修改自动重新读入
set   autowrite                  "自动把内容写回文件
set   cindent                    "根据 C 缩进规则应有的缩进距离
set   cinoptions=:4              "影响 'cindent' 重新缩进 C 程序行的方式
set   nobackup                   "不保留备份文件
set   expandtab                  "插入 <Tab> 时使用合适数量的空格
set   tabstop=4                  "<Tab> 代表的空格数
set   mouse=a                    "鼠标可用
set   number                     "显示行号
set   relativenumber
set   history=1000               "命令历史显示1000条
"set   foldenable                 "折叠
set   nofoldenable
set   foldmethod=syntax          "标志用于指定折叠
set   helplang=cn                "以逗号分隔的语言列表
set   hlsearch                   "高亮匹配文本
set   ignorecase                 "忽略正常字母的大小写
set   incsearch                  "显示目前输入的模式的匹配位置
set   laststatus=2               "最后一个窗口何时有状态行 0: 永不 1: 只有在有至少两个窗口时 2: 总是
set   pumheight=10               "插入模式补全的弹出菜单显示项目的最大数目
set   ruler                      "显示光标位置的行号和列号，逗号分隔
set   scrolloff=3                "光标上下两侧最少保留的屏幕行数
set   shiftwidth=4               "缩进每一步使用的空白数目
set   smartindent                "开启新行时使用智能自动缩进
set   smartcase                  "历史回忆搜索模式
set   wildignore=*.bak,*.o,*~    "文件和目录名的补全中忽略符合其中任何模式的文件
set   wildmenu                   "在命令行的上方显示可能的匹配，然后高亮首个匹配
set   wildmode=list:longest,full "指定的字符所用的补全模式 :h wildmode
set   noswapfile                 "缓冲区不使用交换文件
set   nowrap                     "设置不折行
set   ignorecase                 "搜索模式里忽略大小写
set   cursorline                 "突出当前行
set   magic                      "正则表达式匹配形式
" set autochdir
set   clipboard=unnamed
"set   list lcs=tab:\¦\ ,trail:·,extends:»,precedes:«,nbsp:%
set   encoding=utf-8
set   langmenu=zh_CN.UTF-8
set   backspace=2
" set ambiwidth=double          "防止特殊符号无法正常显示
set   listchars=tab:>-,trail:-
"set term=screen-256color
set   nospell                   " 拼写检查
set   list
"}}}
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/gtags.vim'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'jreybert/vimagit'
Plug 'scrooloose/vim-fugitive'
Plug 'mbriggs/mark.vim'
Plug 'Shougo/denite.nvim'
Plug 'jreybert/vimagit'
Plug 'ddollar/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'brooth/far.vim'
Plug 'honza/vim-snippets'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'itchyny/vim-cursorword'
Plug 'sirver/ultisnips'
Plug 'whatot/gtags-cscope.vim'
Plug 'yggdroot/leaderf'
Plug 'vimwiki/vimwiki'
Plug 'deris/vim-shot-f'
" Initialize plugin system
call plug#end()
" ---------------------------------------------------------
"  ACTION SETTINGS
" ---------------------------------------------------------
" ACTION: Restore Last Position {{{1
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif
"}}}
" ACTION: Switching Between Buffers {{{1
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nmap <C-W>v <C-W>v<c-l>
nmap <C-W>s <C-W>s<c-j>
"}}}
" ---------------------------------------------------------
"  MAPPING SETTINGS
" ---------------------------------------------------------
" FUNCTION: Setting Map Leader {{{1
let mapleader=","
let maplocalleader=";"
"}}}
" FUNCTION: Personal Map-key {{{1
"nmap <leader>lkup <Plug>LookupFile<cr>
map  <leader><space>  :s/\s\+$//ge<cr>
map  <leader><tab>    :s/	/    /g<cr>
map  <leader>l        :s/^\zs\ze/\=printf("%02d.",line("'<") == 0 ? line(".") : line(".")-line("'<") + 1)<cr>
map  <leader>al       :%s/^\zs\ze/\=printf("%02d.", line("."))<cr>
map  <leader>dl       :%s/^\s*[0-9]*.//g<cr>
map  <leader>a<tab>   :%s/	/    /g<cr>
map  <leader>a<space> :%s/\s\+$//ge<cr>
nmap <leader>mma :set mouse=a<cr>
nmap <leader>mmv :set mouse=v<cr>
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
nmap <leader>zz <C-w>o

nmap <Leader>k <Plug>MarkSet
"}}}
" PLUGIN: SrcExpl Settings {{{1
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files'
" to create/update a tags file
" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"nmap <C-I> <C-W>j:call g:SrcExpl_Jump()<CR>
"nmap <C-O> :call g:SrcExpl_GoBack()<CR>
"}}}
let Tlist_Show_One_File = 0
"nmap <silent> <Leader>w :Defx <cr>

" PLUGIN: showmarks Settings {{{1
" 默认开启showmarks
let showmarks_enable = 1
" 只显示全部的大写和小写标记
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" 对文件类型为help、quickfix和non-modifiable(不可修改)的缓冲区，则不显示标记的位置
let showmarks_ignore_type = "hqm"
" 高亮行上下层标记
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
"}}}
" ---------------------------------------------------------
"  TOOLS CONFIGURATION
" ---------------------------------------------------------
" TOOLS: System Sheat Plate {{{1
" Map vim system shear plate by zhendongcao on 2017/8/3
" http://blog.csdn.net/lalor/article/details/7272325
vmap <C-c> "+Y
nmap <C-v> "+p
" '%'     --- 文件打开位置，e.i. vim src/foo.txt >> src/foo.txt
" '%:p'   --- 绝对路径, e.i. /something/src/foo.txt
" '%:t'   --- foo.txt
" '%:p:h' --- something/src
nnoremap <c-c>a :let @+ = expand('%:p')<cr>
inoremap <c-c>a <ESC>:let @+ = expand('%:p')<cr>

nnoremap <c-c>n :let @+ = expand('%:t')<cr>
inoremap <c-c>n <ESC>:let @+ = expand('%:t')<cr>

nnoremap <c-c>d :let @+ = expand('%:p:h')<cr>
inoremap <c-c>d <ESC>:let @+ = expand('%:p:h')<cr>
"}}}
" TOOLS: Batch Annotation {{{1
" www.cnblogs.com/wangkongming/p/4462272.html
"}}}
" TOOLS: cscope Auto add DB {{{1
" cscope.vim
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

function! PRINT()
	call append(line("."), "printf(\"%s:(%d)\\n\",__FUNCTION__,__LINE__);")
endfunction

nmap <leader>1 : call PRINT() <cr>:w<CR>

"}}}
" TOOLS: My own Settings {{{1
" add by lixiang
" cs find t
nmap <C-f> :Leaderf gtags -g 
" fzf
nmap <C-p> :FZF<CR>
" q退出
nmap q :q<CR>

function! Escape(stuff)
    return substitute(escape(a:stuff, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction
" tab 切换
nmap <leader>p :tabp<CR>
nmap <leader>n :tabn<CR>
nmap <leader>c :tabc<CR>
nmap <leader>s :tabs<CR>
nmap <leader>o :tabnew 
" source vimrc
nmap <leader>so :source ~/.vimrc<cr>
nmap H ^
nmap L $

""" buffer{{{
" 顶部buffer目录
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 17
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:rainbow_active = 1

nnoremap <Space>p :b 
" next buf
noremap <Space>n :bn<cr>
" pre buf
noremap <Space>b :bp<cr>
" close current buf
noremap <Space>c :bd<cr>
noremap <C-b> :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <localleader>v :vsplit<cr>
noremap <localleader>s :split<cr>
"}}}

" 注释
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let Tlist_Show_One_File = 0
set runtimepath^=~/.vim/bundle/ag
" 替换k+1行cat to dog
" :.,.+ks/cat/dog
" /搜索当前单词
noremap <Leader>/ /<C-R>=expand("<cword>")<cr><cr>
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme gruvbox
let g:deus_termcolors=256"
nnoremap <C-m> :Magit<cr>
inoremap jj <ESC>
inoremap jk <ESC>:w<cr>
inoremap <C-i> <ESC>I
inoremap <C-a> <ESC>A
noremap <M-s> :w<cr>
vnoremap <localleader>w :'<,'>w! /home/xiang/work/vim-file/a<cr>
noremap <localleader>r :r /home/xiang/work/vim-file/a<cr>
nmap t <Plug>(easymotion-s2)
" powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8 
set laststatus=2
" 退出主编辑窗口后，自动退出vim
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" Defx
nnoremap <silent> <LocalLeader>e
            \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()` <CR>
nnoremap <silent> <LocalLeader>a
            \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

call defx#custom#option('_', {
            \ 'columns': 'indent:git:icons:filename',
            \ 'winwidth': 35,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 0,
            \ 'root_marker': '≡ ',
            \ 'ignored_files':
            \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
            \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
            \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#is_directory() ? 
                \ defx#do_action('open_tree') : 
                \ defx#do_action('multi', ['drop'])
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> i
                \ defx#do_action('multi',[['drop','split']])
    nnoremap <silent><buffer><expr> l
                \ defx#is_directory() ? 
                \ defx#do_action('open_tree') : 
                \ defx#do_action('multi', ['drop'])
"    nnoremap <silent><buffer><expr> E
"                \ defx#do_action('open')
"    nnoremap <silent><buffer><expr> P
"                \ defx#do_action('open', 'pedit')
   nnoremap <silent><buffer><expr> o
                \ defx#is_directory() ? 
                \ defx#do_action('open_or_close_tree') : 
                \ defx#do_action('multi', ['drop'])
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
"    nnoremap <silent><buffer><expr> M
"                \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
                \ defx#do_action('toggle_columns',
                \                'mark:indent:icon:filename:type:size:time')
"    nnoremap <silent><buffer><expr> S
"                \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
"    nnoremap <silent><buffer><expr> !
"                \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('close_tree')
   nnoremap <silent><buffer><expr> yy
               \ defx#do_action('yank_path')
"    nnoremap <silent><buffer><expr> .
"                \ defx#do_action('toggle_ignored_files')
"    nnoremap <silent><buffer><expr> ;
"                \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('close_tree')
"    nnoremap <silent><buffer><expr> ~
"                \ defx#do_action('cd')
"    nnoremap <silent><buffer><expr> q
"                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    "nnoremap <silent><buffer><expr> <C-l>
                "\ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
"    nnoremap <silent><buffer><expr> cd
"                \ defx#do_action('change_vim_cwd')
    nnoremap <C-l> <C-W>l
endfunction
" 折叠
syn region myFold start="{" end="}" transparent fold  " 设置起止符号 
syn sync fromstart 
set foldmethod=syntax  " 设置实用语法方式折叠 
set foldnestmax=2   " 设置最大折叠深度

" 编译
function! MakeRam()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !make ram-boot-image
    endif
    execute ":cd " . curdir
endfunction
map <F9> :call MakeRam() :copen<CR>
  let g:ctrlp_map = '<localleader>p'
" leaderf
" " Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DroidSansMono Nerd Font Mono"
" If needs
set ambiwidth=double
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>m :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <localleader>l :<C-U><C-R>=printf("LeaderfFunction")<CR><CR>

"noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
"noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg --no-ignore -F -e %s ", leaderf#Rg#visual())<CR><CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fc :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <C-j> :<C-U><C-R>=printf("Leaderf! gtags -g %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <leader>a :<C-U><C-R>=printf("Leaderf! rg --no-ignore %s", expand("<cword>"))<CR><CR>
noremap <Leader>g  :Leaderf! rg --no-ignore 
"termninal
tnoremap <Esc> <C-\><C-n>
noremap <c-s> :w<cr>
"vimwiki
 let g:vimwiki_list = [
 \{"path": "~/myblog/vimwiki/", 
 \ "path_html": "~/myblog/wiki/",
 \ "syntax": "markdown", 
 \ "ext": ".md",
 \ "css_file": '~/myblog/vimwiki/wiki/style.css',
 \ "custom_wiki2html": "~/myblog/vimwiki/misaka_md2html.py",
 \ "auto_export": 0}
 \]
 nnoremap <Leader>r :e<cr>
 " vim复制
 if executable('clipboard-provider')
    let g:clipboard = {
          \ 'name': 'myClipboard',
          \     'copy': {
          \         '+': 'clipboard-provider copy',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider copy',
          \     },
          \     'paste': {
          \         '+': 'clipboard-provider paste',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider paste',
          \     },
          \ }
endif
let g:startify_change_to_dir = 0

"YoucomPleteMe:语句补全插件"
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python3.8'    "python版本在3以上
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py' "加载文件路径
"let g:ycm_clangd_binary_path = "~/ycm_temp/llvm_root_dir/bin/clangd"
let g:clang_library_path='/usr/lib/llvm-10/lib/libclang.so'  "libclang路径

autocmd InsertLeave * if pumvisible() == 0|pclose|endif     " 离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_key_invoke_completion = '<C-a>'  
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
let g:ycm_semantic_triggers = {
					\'c,cpp,python,java,go,perl':['re!\w{2}'],
					\'cs,lua,javascript':['re!\w{2}'],
					\}

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>   
let g:ycm_min_num_of_chars_for_completion = 2                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_max_num_candidates = 15							  " 候选数量设置
let g:ycm_auto_trigger = 1									  " 签名帮助
" 关闭ycm预览
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_use_ultisnips_completer = 1


"snippets
let g:UltiSnipsExpandTrigger="<tab>"
" 解决ycm与usnippet tab冲突
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-e>"

"tagbar  
""设置tagbar使用的ctags的插件,必须要设置对  
let g:tagbar_ctags_bin='/usr/bin/ctags'  
"设置tagbar的窗口宽度  
let g:tagbar_width=50  
""设置tagbar的窗口显示的位置,为左边  
let g:tagbar_right=1  
"打开文件自动 打开tagbar  
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  
""映射tagbar的快捷键  
map <F7> :TagbarToggle<CR>
