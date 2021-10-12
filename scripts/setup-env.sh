#!/bin/bash

PATH=/usr/local/tomcat/bin:/usr/local/openjdk-11/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/scripts

echo "[INFO]Installing vim and .vimrc"
apt update
apt install vim -y
vimrc='syntax on
set directory=/tmp
set hlsearch
set tabstop=2 shiftwidth=2
set incsearch
set ruler
set showmode
set showcmd
set softtabstop=2
set autoindent
set showmatch
set ignorecase
set diffopt=filler,context:15,iwhite
set laststatus=2
filetype on
filetype plugin on
filetype indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufReadPost *
set background=dark
hi  Normal       ctermfg=LightGray   ctermbg=Black
hi  NonText      ctermfg=DarkGray    ctermbg=Black
hi  Statement    ctermfg=Green       ctermbg=Black
hi  Comment      ctermfg=DarkMagenta ctermbg=Black
hi  Constant     ctermfg=DarkCyan    ctermbg=Black
hi  Identifier   ctermfg=Cyan        ctermbg=Black
hi  Type         ctermfg=DarkGreen   ctermbg=Black
hi  Folded       ctermfg=DarkGreen   ctermbg=Black        cterm=underline term=none
hi  Special      ctermfg=Yellow      ctermbg=Black
hi  PreProc      ctermfg=LightGray   ctermbg=Black        cterm=bold      term=bold
hi  Scrollbar    ctermfg=Blue        ctermbg=Black
hi  Cursor       ctermfg=white       ctermbg=Black
hi  ErrorMsg     ctermfg=Red         ctermbg=Black        cterm=bold      term=bold
hi  WarningMsg   ctermfg=Yellow      ctermbg=Black
hi  VertSplit    ctermfg=White       ctermbg=Black
hi  Directory    ctermfg=Cyan        ctermbg=DarkBlue
hi  Visual       ctermfg=White       ctermbg=DarkGray     cterm=underline term=none
hi  Title        ctermfg=White       ctermbg=DarkBlue
hi  StatusLine   term=bold           cterm=bold,underline ctermfg=Black   ctermbg=Grey
hi  StatusLineNC term=bold           cterm=bold,underline ctermfg=Gray    ctermbg=Black
hi  LineNr       term=bold           cterm=bold           ctermfg=White   ctermbg=DarkGray
hi  Search       ctermbg=red         ctermfg=none
hi  IncSearch    ctermbg=black       ctermfg=Red'
echo $vimrc > ~/.vimrc
