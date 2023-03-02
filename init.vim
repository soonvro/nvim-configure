" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    init.vim                                           :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: sokwon <sokwon@student.42seoul.kr>         +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2022/12/03 03:36:54 by sokwon            #+#    #+#              "
"    Updated: 2023/03/02 21:58:13 by sokwon           ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" ================================================================================
"                               Plug-In List
" ================================================================================
" ******************** Plug-In start ********************
call plug#begin('~/.vim/plugged')

" ******************** List of Plug-In ********************
" 42-Header
Plug 'pbondoer/vim-42header'
let g:hdr42user='sokwon'
let g:hdr42mail='sokwon@student.42seoul.kr'

" 컬러스킴(색상표) jellybeans, gruvbox
Plug 'morhetz/gruvbox'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree 코드 뷰어 창
Plug 'preservim/nerdtree'

" Tagbar
Plug 'majutsushi/tagbar'

" Automated tag file generation
" and syntax highlighting of tags in Vim.
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" CtrlP 파일 탐색 플러그인
Plug 'ctrlpvim/ctrlp.vim'

" Treesitter문법 하이라이팅
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" 괄호 색 짝맞춤
" Plug 'frazrepo/vim-rainbow'
" let g:rainbow_active = 1

" CScope 플러그인
"Plug 'ronakg/quickr-cscope.vim'

" ******************** Initialize Plug-In system ********************
call plug#end()

" ================================================================================
"                               My nvim settings
" ================================================================================

set nu rnu
set ft=4 ts=4 sts=4 sw=4
set autoindent cindent
set ruler " 현재 커서 위치 표시
set showmatch " 일치하는 괄호 하이라이팅
set ignorecase smartcase " 대문자 검색 시에만 대소문자 구별
set hlsearch " 탐색 문자열 강조
set mouse=a " 모든 마우스 기능을 사용
set list listchars=tab:▸· " tab 문자를 눈에 보이게
" set laststatus=2

set cursorline
" 입력모드에선 커서줄 없고
autocmd InsertEnter * set nocursorline
" 명령모드에선 커서줄 보기
autocmd InsertLeave * set cursorline
" 커서 하이라이팅 글자
" highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
" highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" 커서가 중앙에 오도록 하는 함수
" <https://stackoverflow.com/questions/13398631/always-keep-the-cursor-centered-in-vim>
function! CentreCursor()
    let pos = getpos(".")
    normal! zz
    call setpos(".", pos)
endfunction
autocmd CursorMoved,CursorMovedI * call CentreCursor()

if has('nvim')			" nvim 을 사용 중이라면
	set inccommand=nosplit	" nvim live %s substitute (실시간 강조)
endif

" 터미널 gui 컬러 사용
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" --------------------------------------------------
" My Custom Auto Command
" --------------------------------------------------
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" --------------------------------------------------
" My Custom Mapping
" --------------------------------------------------
nnoremap <F9> :! norm %<CR>
nnoremap <F10> :!cc_run %
nnoremap <C-j> 10j
nnoremap <C-k> 10k
vnoremap <C-j> 10j
vnoremap <C-k> 10k

" --------------------------------------------------
" My Custom Wildignore
" --------------------------------------------------
set wildignore+=*.out,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" --------------------------------------------------
" Plug-In vim-airline 설정 - 항상 colorscheme 전에!
" --------------------------------------------------
" powerline-font 활성화
let g:airline_powerline_fonts = 1
" luna 테마 사용
let g:airline_theme = 'gruvbox'
" tabline 에 파일명만 출력 되도록 설정
let g:airline#extensions#tabline#formatter = 'unique_tail'
" 창의 상단에 표시되도록 설정
" let g:airline_statusline_ontop = 1
" 탭라인 허용
let g:airline#extensions#tabline#enabled = 1
" 항상 tabline 을 표시
let g:airline#extensions#tabline#show_tabs = 1

" --------------------------------------------------
" colorscheme 설정 - 항상 highlight 전에 둘 것!
" --------------------------------------------------
let g:gruvbox_italic=1
colorscheme gruvbox

" --------------------------------------------------
" ctags settings
" --------------------------------------------------
" set tags=./tags;~

" --------------------------------------------------
" Plug-In Tagbar settings
" --------------------------------------------------
"  tagbar 열고 커서를 tagbar로 이동
nmap <F8> :TagbarToggle<CR><ESC>:5 wincmd l<CR>

" --------------------------------------------------
" Plug-In Vim-EasyTags
" --------------------------------------------------
"  Project별 tags file 을 사용.
"  만약 tags file이 없으면, 전역 tag file을 사용.
set tags=./tags;~,~/.vimtags
let g:easytags_dynamic_files = 1
" 속도 향상을 위한 비동기식 업데이트
let g:easytags_async = 1
" 커서 정지 시 자동 실행 끄기.
let g:easytags_on_cursorhold = 1
" 모든 자동 update 끄기.
let g:easytags_auto_update = 0
" 모든 자동 highlight 끄기.
let g:easytags_auto_highlight = 1
" 버퍼 저장 시 update & highlight.
autocmd BufWritePost *.c,*.cpp,*.h if filereadable("./tags") | UpdateTags | endif
autocmd BufEnter,BufWritePost *.c,*.cpp,*.h HighlightTags
" Customize the highlighting colors
highlight cFunctionTag	guifg=#83a598 gui=bold
highlight cEnumTag	guifg=#8ec07c

" --------------------------------------------------
" Plug-In Nerdtree 설정
" --------------------------------------------------
" key mapping for NERDTreeToggle.
nmap <F6> :NERDTreeToggle<CR>
" Close automatically when open a file for editing.
let NERDTreeQuitOnOpen = 1
" 창 크기(가로)를 20 으로 설정
let g:NERDTreeWinSize=30

" --------------------------------------------------
" Plug-In Ctrlp 설정
" --------------------------------------------------
" Ctrlp에서 루트 폴더를 인식할 때 확인하는 파일.
" let g:ctrlp_root_markers = ['tags']
" Exclude files and directories.
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" Ctrlp 창 높이 설정.
let g:ctrlp_match_window = 'min:4,max:10'
" 현재 디렉토리에서 ctrlp 실행하도록 mapping.
let g:ctrlp_cmd='CtrlP .'
" let g:ctrlp_map = ''
" noremap <c-p> :CtrlP .<CR>
" 최근 사용한 파일
noremap <C-/> :CtrlPMRUFiles .<CR>
noremap <C-_> :CtrlPMRUFiles .<CR>
noremap <F5> :CtrlPClearCache<CR>

" 구문 강조 사용
if has("syntax")
 syntax enable
endif


" zsh
" let &shell='/bin/zsh -i'
" 실행 안되면 윗라인 대신 아랫라인
" autocmd vimenter * let &shell='/bin/zsh -i'
" bash
" let &shell='/bin/bash -i'
