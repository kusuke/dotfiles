@echo off

rem Vim�̃f�B���N�g�����w��
set vim_dir="D:\works\vim74-kaoriya-win32"
rem Github���玝���Ă���dotfiles�̃f�B���N�g�����w��
set dotfiles_dir="D:\works\dotfiles"

rem .vimrc��.gvimrc�̓n�[�h�����N
fsutil hardlink create "%vim_dir%\_vimrc" "%dotfiles_dir%\.vimrc"
fsutil hardlink create "%vim_dir%\_gvimrc" "%dotfiles_dir%\.gvimrc"

rem vimfiles�ւ̓V���{���b�N�����N
mklink /d %vim_dir%\vimfiles %dotfiles_dir%\vimfiles