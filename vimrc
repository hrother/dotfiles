" About {{{ :
  " vimrc of Holger Rother
  " with suggestions by Beate Franken and Sven Guckes.
  " Bits and pieces are picked up from the so called Internet ;)
" }}}

" Setup {{{

  set nocompatible
  set bg=dark
  filetype plugin on

  " Config vundle -> manage vim scripts easy {{{
     set nocompatible               " be iMproved
     filetype off                   " required!

     set rtp+=~/.vim/bundle/vundle/
     call vundle#rc()

     " let Vundle manage Vundle
     " required! 
     Plugin 'gmarik/vundle'

     " My Plugins here:
     "
     " original repos on github
     Plugin 'tpope/vim-fugitive'
     Plugin 'tpope/vim-surround'
     Plugin 'tpope/vim-repeat'
     Plugin 'tpope/vim-rails.git'
     Plugin 'tpope/vim-unimpaired.git'
     Plugin 'tpope/vim-abolish'
     Plugin 'msanders/snipmate.vim'
     Plugin 'dhruvasagar/vim-table-mode'
     Plugin 'scrooloose/nerdcommenter'
     Plugin 'scrooloose/nerdtree'
     Plugin 'scrooloose/snipmate-snippets'
     Plugin 'scrooloose/syntastic'
     Plugin 'majutsushi/tagbar'
     Plugin 'nathanaelkane/vim-indent-guides'
     Plugin 'vim-scripts/TaskList.vim'
     Plugin 'Lokaltog/powerline'
     Plugin 'jamessan/vim-gnupg'
     Plugin 'mbbill/undotree'
     Plugin 'Lokaltog/vim-distinguished'
     Plugin 'sjl/badwolf'
     Plugin 'Keithbsmiley/tmux.vim'
     Plugin 'nelstrom/vim-qargs'
     Plugin 'nelstrom/vim-visual-star-search'
     Plugin 'kana/vim-textobj-user'
     Plugin 'kana/vim-textobj-lastpat'
     Plugin 'christoomey/vim-tmux-navigator'
     Plugin 'airblade/vim-gitgutter'
     Plugin 'altercation/vim-colors-solarized'
     Plugin 'sk1418/HowMuch'
     Plugin 'sk1418/Join'
     Plugin 'kien/ctrlp.vim'
     Plugin 'benmills/vimux'
     Plugin 'vim-scripts/py-coverage'
     Plugin 'klen/rope-vim'
     Plugin 'davidhalter/jedi-vim'
     Plugin 'hrother/msmtp.vim'
     Plugin 'hrother/offlineimaprc.vim'
     "" vim-scripts repos
     Plugin 'L9'
     "" non github repos
     "Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
     filetype plugin indent on     " required! 
  "}}}
"}}}

" Formatting {{{

  " Indenting {{{
    set softtabstop=2
    set shiftwidth=2
    set expandtab
  "}}}

  " Text {{{
    set wrap
    set tw=80
    " insert 'comment leader' when starting a new line
    set formatoptions=cqrt
    set comments=b:#,:%,fb:-,n:>,n:)
    " shows tabs and trailing spaces
    set list
    set listchars=tab:»·,trail:·
    "set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
    "set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
    "set showbreak=↪
  " }}}

" }}}

" UI {{{

  " Status line {{{
    set wildmenu
    set wildmode=longest,list
    set showcmd
    set ch=2
    set laststatus=2
    set shortmess=at
    set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]\ %{fugitive#statusline()}
    set stl+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    set showmode
  " }}}

  " Cursor {{{
    set cursorline
    set ruler
  "}}}

  " Search {{{
    set hlsearch
    set ignorecase
    set smartcase
  " }}}

  " Misc {{{
    " set number and relativenumber enables relativenumbers for all lines except
    " the cursor line. The cursor line shows the absolute line number.
    set number
    set relativenumber
    set showmatch
    set history=500
  " }}}

" }}}

" GUI {{{
  " show selected text in gray if using gvim
    hi Visual guifg=#ff00ff

  " Bars and menus {{{
    set guioptions-=m "remove menu bar
    set guioptions-=T "remove tool bar
    set guioptions-=r "remove right scrollbar
  " }}}

  " Colorschemes {{{
    " use different colorschemes in gui and console
    if has('gui_running')
      "colorscheme distinguished
      colorscheme badwolf
      set guifont=Inconsolata\ 14
      set vb t_vb=
    else
      if $COLORTERM=='gnome-terminal'
        set term=gnome-256color
        "colorscheme distinguished
        colorscheme badwolf
        set t_ut=
        set t_Co=256
      else
        colorscheme torte
      endif
    endif
  " }}}

  " get rid of blinking cursor in gvim {{{
    let &guicursor = &guicursor . ",a:blinkon0"
  "}}}
" }}}

" Misc {{{
  set hidden
  set autowrite
  set writebackup
  set backupdir=~/.tmp
  set directory=~/.tmp
  set notagrelative
  set tags=~/.tmp/tags;
  set nostartofline
  set backspace=2
  set ww=<,>,h,l
  set cpoptions=ces$
  setlocal spell spelllang=en_us
  set spell
  set viminfo='20,\"50
  "Prevent Vim from clobbering the scrollback buffer.
  set t_ti= t_te=
  runtime macros/matchit.vim
" }}}

  " Key Mappings {{{
    " Thinkpad {{{
      map #1 
      imap #1 
      cmap #1 
    " }}}

    " vimrc {{{
      map <leader>vi :vsp ~/.vimrc<CR>
      map <leader>u :source ~/.vimrc<CR>
    " }}}

    " Syntax {{{
      nn __ mg:if has("syntax_items")<Bar>syn clear<CR>else<Bar>syn on<CR>en<CR>`g
      syn on
    " }}}

    " Paste/Yank {{{
      map <leader>p "+p
      map <leader>P "+P
      map <leader>y "+y
      map <leader>Y "+Y
    " }}}

    " Tab mappings {{{
      map <leader>tt :tabnew<CR>
      map <leader>te :tabedit
      map <leader>tc :tabclose<CR>
    " }}}

    " Create/refresh Tags {{{
      map <leader>ct :GenerateTags<CR>
    "}}}


    "Searching {{{
      :nnoremap <CR> :nohlsearch<cr>
    "}}}

    " Notes {{{
    map <leader>nc :e ~/Dropbox/notes/coding-notes.txt<cr>
    map <leader>ncs :e ~/Dropbox/otes/sharpening-the-chainsaw.txt<cr>
    map <leader>nsp :e ~/Dropbox/notes/slingshot/project-notes.txt.gpg<cr>
    map <leader>nsc :e ~/Dropbox/notes/slingshot/coding-notes.txt.gpg<cr>
    map <leader>nst :e ~/Dropbox/notes/slingshot/timing-notes.txt.gpg<cr>
    map <leader>nm :e ~/Dropbox/notes/math-II.tex<cr>
    " }}}

    " ctrlp {{{
      map <leader><space> :CtrlP<CR>
      map <leader>r :CtrlPClearCache<CR>
      map <leader>b :CtrlPBuffer<CR>
    " }}}

    " NERDTree {{{
      map <leader>nt :NERDTreeToggle<CR>
    " }}}

    " TaskList {{{
      map <leader>tl <Plug>TaskList
    " }}}

    " Tagbar {{{
      "map <leader>tb :TagbarToggle<CR>
    " }}}

    " Undotree {{{
      if has("persistent_undo")
        map <leader>ut :UndotreeToggle<CR>
      endif
    "}}}

    " Fugitive {{{
    map <leader>gc :Gcommit<CR>
    map <leader>gs :Gstatus<CR>
    map <leader>gw :Gwrite<CR>
    " }}}

    " Open files in same directory as the current file {{{
      map <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
      map <leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
      map <leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
    "}}}

  " }}}

  " Commands {{{

  " Typo fixing {{{
  command! Q :q
  command! W :w
  " }}}

    " Write RO file {{{
      if has('gui_running')
        cmap w!! %!gksu-polkit tee > /dev/null %
      else
        cmap w!! %!sudo tee > /dev/null %
      endif
    "}}}

    " Formating {{{
      command! DeleteTrailingWs :%s/\s\+$//
    " }}}

    " Tags {{{
        command! GenerateTags call system('ctags -R -f ~/.tmp/tags --python-kinds=-i --exclude=.git .') | echo
    "}}}
  " }}}

  " Functions {{{
  " }}}

  " Auto commands {{{

    " All Files {{{
      autocmd BufNewFile,BufRead * set formatoptions=tcql nocindent comments&
    " }}}

    " C {{{
      autocmd BufNewFile,BufRead *.c,*.h set formatoptions=croql cindent foldmethod=syntax foldlevel=0 foldcolumn=2 comments=sr:/*,mb:*,el:*/,:// makeprg=gcc\ -Wall\ -o\ %<.out\ %
    "}}}

    " Java {{{
      autocmd BufNewFile,BufRead *.java set textwidth=80 complete=.,w,b,u,t,i foldmethod=syntax foldlevel=0 foldcolumn=2 formatoptions=croql cindent
    " }}}

    " Ruby {{{
      autocmd BufNewFile,BufRead *.erb set  nocindent shiftwidth=2 tabstop=2 expandtab
      autocmd BufNewFile,BufRead *.rb set nocindent shiftwidth=2 tabstop=2 expandtab
    " }}}

    " Ruby-on Rails {{{
      autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
    " }}}

    " asm {{{
      autocmd BufNewFile,BufRead *.asm set syntax=mips2G
    " }}}

    " perl {{{
      autocmd BufNewFile,BufRead *.pl set keywordprg=perldoc
    " }}}

    " python {{{
      autocmd BufNewFile,BufRead *.py set nocindent shiftwidth=4 tabstop=4 softtabstop=4 expandtab tw=79
      autocmd FileType python set omnifunc=pythoncomplete#Complete
    " }}}

    " dot {{{
      autocmd BufNewFile,BufRead *.dot map <c-d> :!dot -Tsvg % -o %<.svg
    " }}}

    " indent p tagts {{{
      autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif
    " }}}

    " latex {{{
      autocmd BufNewFile,bufRead *.tex setlocal nofoldenable
    " }}}

  " }}}

  " Plugin config {{{


    " latex-suite {{{
      set grepprg=grep\ -nH\ $*
      filetype indent on
      let g:Tex_DefaultTargetFormat='pdf'
      let g:tex_flavor='latex'
      let g:Tex_GotoError=0
    " }}}

    " Snipmate {{{
      let g:snips_author = 'Holger Rother'
    " }}}

    " vim-tmux {{{ 
      " latex-suites imap.vim plugin binds <c-j> in normalmode
      " if a maping for IMAP_JumpForward exists this mapping is not created
      " So map it to something
      nmap <C-`> <Plug>IMAP_JumpForward
    " }}}

    " Syntastic {{{
      let g:syntastic_check_on_open=1
      let g:syntastic_auto_loc_list=0
      let g:syntastic_loc_list_height=5
      let g:syntastic_error_symbol='✗'
      let g:syntastic_warning_symbol='⚠'
      let g:syntastic_python_checkers=['pylint']
    " }}}

    " jedi-vim {{{
      " No auto suggestions on dot
      let g:jedi#popup_on_dot=0
      " Use default completion key binding
      let g:jedi#completions_command="<C-N>"
    "}}}

    " Undotree {{{
      if has("persistent_undo")
          set undodir='/home/holger/.vimundo/'
          set undofile
      endif
    "}}}

    " Powerline {{{
       set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
       " only powerline shows mode
       set noshowmode
    "}}}

    " Table-mode {{{
      let g:table_mode_fillchar = '='
      let g:table_mode_seperator = '#'
    "}}}

    " Vimux {{{
     " Prompt for a command to run
     map <Leader>vp :VimuxPromptCommand<CR>
     " Run last command executed by VimuxRunCommand
     map <Leader>vl :VimuxRunLastCommand<CR>
     " Inspect runner pane
     map <Leader>vr :VimuxInspectRunner<CR>
     " Close vim tmux runner opened by VimuxRunCommand
     map <Leader>vq :VimuxCloseRunner<CR>
     " Interrupt any command running in the runner pane
     map <Leader>vx :VimuxInterruptRunner<CR>
     " Zoom the runner pane (use <bind-key> z to restore runner pane)
     map <Leader>vz :call VimuxZoomRunner()<CR>
    "}}}

  " }}}

  syntax spell toplevel
  " vim: set foldmethod=marker:
