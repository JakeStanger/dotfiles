"run on startup
autocmd vimenter * NERDTree

"focus on editor by default (go to previous window)
autocmd vimenter * wincmd p

"close vim if nerdtree is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"go to pwd
autocmd BufEnter * lcd %:p:h

let NERDTreeMinimalUI = 1
let NErdTReeDirArrows = 1

"enable nerdtree-tabs to keep open nerdtree on all tabs
let g:nerdtree_tabs_open_on_console_startup=1
