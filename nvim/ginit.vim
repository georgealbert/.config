" To check if neovim-qt is running, use `exists('g:GuiLoaded')`,
" " see https://github.com/equalsraf/neovim-qt/issues/219
" https://github.com/jdhao/nvim-config/blob/master/ginit.vim
if exists('g:GuiLoaded')
  call GuiWindowMaximized(1)
  GuiTabline 0
  " GuiPopupmenu 0
  " GuiLinespace 0

  " Ubuntu Mono和中文一起显示的时候，设置为2，中文高度才ok.
  "  GuiLinespace 2
  " GuiFont! Hack:h10:l
  " GuiFont! Ubuntu\ Mono:h12:l
  " GuiFont! Ubuntu\ Mono:h12
  " Ll1oO0iIjqpb Open

"  现在用的，在eizo上看着有点发虚.
"  GuiFont! Ubuntu\ Mono\ derivative\ Powerline:h11

"  GuiFont! 微软雅黑:h11:cGB2312

" [2019/12/4 22:25:02]  NovaMono太圆了，过于卡通，不好看.
"  GuiFont NovaMono\ for\ Powerline:h11

" [2019/12/4 22:31:23] 不是等宽的，neovim用不了
"  GuiFont! Meslo\ LG\ S\ for\ Powerline:h11

" [2019/12/4 22:40:34] 显示不好看，有点虚
"  GuiFont! Go\ Mono\ for\ Powerline:h11

" [2019/12/4 22:42:12] h10太小，h11太大。
"  GuiFont! DejaVu\ Sans\ Mono\ for\ Powerline:h11

" [2019/12/4 22:45:44] Hack is not a fixed pitch font. 这。。。
" 0显示好丑，大写O太瘦了，太像0了。
"  GuiFont! Hack:h11

" [2019/12/4 22:59:13] 太淡了，看不清楚
"  GuiFont! Inconsolata\ for\ Powerline:h11

" GuiFont! Bitstream\ Vera\ Sans\ Mono:h12
" GuiFont! Droid\ Sans\ Mono:h12
"  GuiFont! Consolas-with-Yahei:h11

"  GuiFont! Fixedsys\ Excelsior:h12
"  GuiLinespace 2

" [2019/12/11 22:17:28] 更纱黑体的效果不错，配合 GuiLinespace = -1
" 感觉比Fixedsys Excelsior好看点，特别是powerline的几个字符
" h10:HP zhan66 G1 pro
" h12:s2319
  GuiFont! 等距更纱黑体\ T\ SC:h12
  GuiLinespace -1

  " Use shift+insert for paste inside neovim-qt,
  " see https://github.com/equalsraf/neovim-qt/issues/327#issuecomment-325660764
  inoremap <silent> <S-Insert> <C-R>+
  cnoremap <silent> <S-Insert> <C-R>+

  " For Windows, Ctrl-6 does not work. So we use this mapping instead.
  " nnoremap <silent> <C-6> <C-^>
endif
