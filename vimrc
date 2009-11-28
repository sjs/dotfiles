syntax on
set background=dark
set shiftwidth=4
set tabstop=4
set expandtab

set laststatus=2 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 


set ruler						" show the line number on the bar
set autoread					" watch for file changes
set number						" line numbers
set showmode
set showcmd
set nocompatible				" vim, not vi
set autoindent smartindent		" auto/smart indent
set smarttab					" tab and backspace are smart
set viminfo=""

set scrolloff=5					" keep at least 5 lines above/below
set sidescrolloff=5				" keep at least 5 lines left/right
set shell=bash
set fileformats=unix
set ff=unix
filetype on						" Enable filetype detection
filetype indent on				" Enable filetype-specific indenting
filetype plugin on				" Enable filetype-specific plugins

"  backup
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
end

source ~\.vimrc.local
