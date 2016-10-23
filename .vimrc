" Use https://github.com/amix/vimrc
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Use http://www.vim.org/scripts/script.php?script_id=2465
set term=xterm-256color
set t_Co=256
colorscheme wombat256mod
set cursorline

" Mapping for tabs.
map <F10> :tabnew
map <F11> :tabprev<cr>
map <F12> :tabnext<cr>

" Mapping NERD Tree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <c-n><c-n> :NERDTreeToggle<cr>
map <c-n><c-b> :NERDTreeFromBookmark
map <c-n><c-f> :NERDTreeFind<cr>

" Memo:
" - Use <c-f> to open ctrlp, and use <c-t> to open file in a new tab.
