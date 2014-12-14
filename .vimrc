" sudo apt-get install vim vim-scripts vim-doc vim-addon-manager ctags cscope
" vim-addons install taglist supertab omnicppcomplete winmanager minibufexplorer project
" =============================================================================
"        General Setting
" =============================================================================

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"have Vim load indentation rules and plugins according to the detected filetype
filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

set ignorecase " 搜索模式裡忽略大小寫
"set smartcase " 如果搜索模式包含大寫字元，不使用 'ignorecase' 選項。只有在輸入搜索模式並且打開 'ignorecase' 選項時才會使用。
set autowrite " 自動把內容寫回檔: 如果檔被修改過，在每個 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令時進行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令轉到別的文件時亦然。
set autoindent " 設置自動對齊(縮進)：即每行的縮進值與上一行相等；使用 noautoindent 取消設置
"set smartindent " 智慧對齊方式
set tabstop=4 " 設置定位字元(tab鍵)的寬度
set softtabstop=4 " 設置軟定位字元的寬度
set shiftwidth=4 " (自動) 縮進使用的4個空格
set cindent " 使用 C/C++ 語言的自動縮進方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "設置C/C++語言的具體縮進方式
"set backspace=2 " 設置倒退鍵可用
set showmatch " 設置匹配模式，顯示匹配的括弧
set linebreak " 整詞換行
set whichwrap=b,s,<,>,[,] " 游標從行首和行末時可以跳到另一行去
"set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes) "使用滑鼠
set number " Enable line number "顯示行號
"set previewwindow " 標識預覽視窗
set history=50 " set command history to 50 "歷史記錄50條

"---------------------------------------------------------------------------
" General Setting \ fold setting
"---------------------------------------------------------------------------
set foldmethod=syntax " 用語法高亮來定義折疊 
set foldlevel=100 " 啟動vim時不要自動折疊代碼 
set foldcolumn=5 " 設置折疊欄寬度  常用命令

"---------------------------------------------------------------------------
" General Setting \ QuickFix setting
"---------------------------------------------------------------------------
" 按下F6，執行make clean
map <F6> :make clean<CR><CR><CR>
" 按下F7，執行make編譯器，並打開quickfix視窗，顯示編譯資訊
map <F7> :make<CR><CR><CR> :copen<CR><CR>
" 按下F8，游標移到上一個錯誤所在的行
map <F8> :cp<CR>
" 按下F9，游標移到下一個錯誤所在的行
map <F9> :cn<CR>
" 以上的映射是使上面的快速鍵在插入模式下也能用
imap <F6> <ESC>:make clean<CR><CR><CR>
imap <F7> <ESC>:make<CR><CR><CR> :copen<CR><CR>
imap <F8> <ESC>:cp<CR>
imap <F9> <ESC>:cn<CR>

"--狀態行設置--
"set laststatus=2 " 總顯示最後一個視窗的狀態行；設為1則視窗數多於一個的時候顯示最後一個視窗的狀態行；0不顯示最後一個視窗的狀態行
"set ruler " 尺規，用於顯示游標位置的行號和列號，逗號分隔。每個視窗都有自己的尺規。如果視窗有狀態行，尺規在那裡顯示。否則，它顯示在螢幕的最後一行上。


"--命令列設置--
set showcmd " 命令列顯示輸入的命令
set showmode " 命令列顯示vim當前模式

"--find setting--
set incsearch " 輸入字串就顯示匹配點
set hlsearch 

" =============================================================================
"        Plugin Setting
" =============================================================================
"---------------------------------------------------------------------------
" Plugin Setting \ Taglist
"---------------------------------------------------------------------------
let Tlist_Ctags_Cmd='ctags' "因為我們放在環境變數裡，所以可以直接執行
let Tlist_Use_Right_Window=1 "讓視窗顯示在右邊，0的話就是顯示在左邊  
let Tlist_Show_One_File=0 "讓taglist可以同時展示多個檔的函數清單
let Tlist_File_Fold_Auto_Close=1 "非當前檔，函數清單折疊隱藏  
let Tlist_Exit_OnlyWindow=1 "當taglist是最後一個分割視窗時，自動推出vim
"是否一直處理tags.1:處理;0:不處理  
let Tlist_Process_File_Always=1 "即時更新tags
let Tlist_Inc_Winwidth=0

"---------------------------------------------------------------------------
" Plugin Setting \ MiniBufferExplorer
"---------------------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切換到當前視窗的上下左右視窗
let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭頭，可以切換到當前視窗的上下左右視窗
let g:miniBufExplMapCTabSwitchBufs = 1 " 啟用以下兩個功能：Ctrl+tab移到下一個buffer並在當前視窗打開；Ctrl+Shift+tab移到上一個buffer並在當前視窗打開；ubuntu好像不支持
"let g:miniBufExplMapCTabSwitchWindows = 1 " 啟用以下兩個功能：Ctrl+tab移到下一個視窗；Ctrl+Shift+tab移到上一個視窗；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1 " 不要在不可編輯內容的視窗（如TagList視窗）中打開選中的buffer


"---------------------------------------------------------------------------
" Plugin Setting \ WinManager
"---------------------------------------------------------------------------
let g:winManagerWindowLayout='FileExplorer|TagList' " 設置我們要管理的外掛程式 "
let g:persistentBehaviour=0 " 如果所有編輯檔都關閉了，退出vim
nmap wm :WMToggle<cr> 常用命令

"---------------------------------------------------------------------------
" Plugin Setting \ ctags
"---------------------------------------------------------------------------
" map <ctrl>+F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR> 
imap <F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR> 
set tags=tags
set tags+=./tags
set tags+=/usr/include/tags

"---------------------------------------------------------------------------
" Plugin Setting \ OmniCppComplete
"---------------------------------------------------------------------------
" -- required --
set nocp " non vi compatible mode
filetype plugin on " enable plugins
" -- optional --
" auto close options when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone
" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

