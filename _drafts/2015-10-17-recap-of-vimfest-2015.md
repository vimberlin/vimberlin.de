---
layout: post
title: Recap of Vimfest 2015
---

## SvenG

[@guckes](http://www.guckes.net/)

- [i3 window manager](http://www.guckes.net/Setup/i3-config)
- [vim book from steve oualline](http://www.truth.sk/vim/vimbook-OPL.pdf)
- [buch von kurt pfeifle über PDFs](http://leanpub.com/pdfkungfoo)
- [polyglot PDF+WAV](https://www.alchemistowl.org/pocorgtfo/)
- [Sven's Minimal Vim Config](http://www.guckes.net/vim/setup.html)
- [Starter File für Tags](http://www.guckes.net/Setup/vimtags.txt)
- [notes/signatures with agrep](http://www.guckes.net/agrep)
- [mutt workshop setup file](http://www.guckes.net/Setup/muttrc.workshop.de.txt)


## Tim Quellmalz:

[@tqmz](https://github.com/tqmz)

### Tab & Trailing Whitespace

```vim
" shortcuts for replacing tabs / removing trailing whitespace
nmap <silent> <LocalLeader>ct :%s/\t/    /g<CR>:%s/\s\+$//g<CR>
nmap <silent> <LocalLeader>cs :%s/\s\+$//g<CR>

" alternative
:help retab
```

### Firefox

start multiple profiles (instances) at the same time (open profiles of current topics only):

- `firefox -no-remote -P %u`
- `iceweasel -no-remote -P %u`


- [FireTitle](https://addons.mozilla.org/De/firefox/addon/firetitle/): to name windows (use Ctrl-; to name session)
- [Tab-Groups](https://support.mozilla.org/en-US/kb/tab-groups-organize-tabs) + [TabGroup Menu](https://addons.mozilla.org/de/firefox/addon/tabgroups-menu/): Enable it inside preferences and drop it in the address line
- [Tile Tabs](https://addons.mozilla.org/de/firefox/addon/tile-tabs/): Split Tab on one screen
- [Restclient](https://addons.mozilla.org/en-US/firefox/addon/restclient/): Restclient
- [RSS Icon](https://addons.mozilla.org/en-US/firefox/addon/rss-feed-icon-in-navbar): rss icon the urlbar


### Jabber
- [prosody is a good Jabber-Server](http://prosody.im)


### Chrome
- [PostMan](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop): Restclient


### Zsh

- [zsh 5.0.8 ... vim-like textobjects in vi mode](https://www.reddit.com/r/zsh/comments/2zpfns/zsh_508_will_have_vimlike_textobjects_in_vi_mode/)
- [opp.zsh](https://github.com/hchbaw/opp.zsh)
- [Adding Vi To Your Zsh](http://dougblack.io/words/zsh-vi-mode.html)

```sh
bindkey -v
```

- [oh-my-zsh plugin pj](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/pj/pj.plugin.zsh): pass a blog, quickly find folders


### Blogging

- static site generators, like [jekyll](https://jekyllrb.com/ "jekyll")
- flat filebased cms, like [KirbyCMS](http://getkirby.com/)


### Markdown

- [Markdown-Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)


### Vim Sessions

project-wise sessions
path/to/project/.vimrc:

```vim
" restore actions (tab selection, window resizing etc.)
source .vimsession
" restore buffers ... and history of commands, searches, buffers etc.
exec "set viminfo=%,'50,<1000,s100,:50,@10,/50,n" . g:proj_path . ".viminfo"
" map F10 to save & exit
exec   "nmap <silent> <F10> :mksession! " . g:proj_path .   ".vimsession<CR>:wviminfo! " . g:proj_path .   ".viminfo<CR>:qa!<CR>"
```

### Vim Colors

```vim
Cursor "Fadenkreuz"
set cursorcolumn                       " highlight the current column – disturbs autocompletetion background!
set cursorline                         " highlight current line
```


### BufExplorer

- [BufExplorer](https://github.com/jlanzarotta/bufexplorer): Plugin for Buffers


### Xmodmap

~/.Xmodmap:

```sh
! map Capslock as additional Ctrl key
clear   Lock
clear   Control
keycode 66 = Control_L
add     Control = Control_L Control_R
```

- `xmodmap ~/.Xmodmap`
- `xmodmap -pke` for a list of all current
- map [ and ] to other keys on German keyboard (?)


### Tags

- use multiple tag files:

```vim
set tags=./tags;/,tags;/
```


### Nerdtree

```vim

" Map NERDTreeToggle to convenient key
nmap <leader>n :NERDTreeToggle<cr>

" Set local mapleader
let mapleader = "_"

" a nice shortcut for ppl with french keyboard layout who don't write french
" often; use `r` (replace) to type it nonetheless
map! ç <Esc>
```


### pandoc
pandoc

```vim
:autocmd FileType pdc noremap <C-M> :w!<CR>:!pandoc -s -f markdown -t latex % -o %.pdf<CR>
```


## Daniel Hahler

[@blueyed](http://daniel.hahler.de)

- Use "Space" as leader (not for imap!):

```vim
let mapleader = ","
nmap <space> <Leader>
vmap <space> <Leader>
```

- [Vim session management](https://github.com/xolox/vim-session)
- [Rofi](https://github.com/DaveDavenport/rofi): A window switcher, run dialog and dmenu replacement
- [vim-sensible](https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim)
- [cursorcross](https://github.com/mtth/cursorcross.vim)
- [zsh-autoenv](https://github.com/Tarrasch/zsh-autoenv): project-based settings for your shell
- <https://github.com/tpope/vim-projectionist>
- [vim-diminactive](https://github.com/blueyed/vim-diminactive): dim inactive windows, w/ vader tests (tmux based)
- [shuber/vim-promiscuous](https://github.com/shuber/vim-promiscuous): #context #switch #branches
- [embear/vim-localvimrc](https://github.com/embear/vim-localvimrc): #vimrc #base
- [tpop/vim-abolish](https://github.com/tpope/vim-abolish): #renaming #casevariants
  - Tim: see also [repren](https://github.com/jlevy/repren)
- [Shougo/unite.vim](https://github.com/Shougo/unite.vim): Unite and create user interfaces #launcher


## Max

- yankstack: <https://github.com/maxbrunsfeld/vim-yankstack>
- See <https://github.com/maxbrunsfeld/vim-yankstack#compatibility> if you also use vim-sneak.
- Peek into register contents, e.g. from `<C-r>` in insert mode: <https://github.com/junegunn/vim-peekaboo>


### Copy & Paste
- `"+y` into register clipboard/ctrl+v (+), yank (copy)
- `"+p` from register clipboard, paste
- `"*y` into register mouse middle click, yank
- `"*p` paste ...

```vim
set clipboard=unnamed
set clipboard=unnamedplus
vmap <c-c> "*y
```


### Auto Complete (u.a. Ruby)
- `^n (ctrl+n)` -> `:h CTRL-N`
- ctags <http://ctags.sourceforge.net/>


## Matthias Günther

[@wikimatze](http://wikimatze.de/about)


### Syntaxdetection
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) Loading language packs on demand - saves a lot of startup time.


### Read the output of a Ex command and paste the output in the current
`:r!` (e.g. `:r! ls`)


### Nice operating system
- <http://www.voidlinux.eu/>


### Startuptime

<vim --startuptime /tmp/startup>

## Browser
- Firefox: [VimFx](https://github.com/akhodakivskiy/VimFx)
- Chromium: [Vimium](http://vimium.github.io/)


### wemux
<http://martinbrochhaus.com/pair.html>


### Vim backups
```vim
if !isdirectory($HOME . '/.vim/backup')
  call mkdir($HOME . '/.vim/backup')
endif

set backupext=~                 " backup file extension
set backupdir=$HOME/.vim/backup " directory of backups
set backupcopy=yes              " keep attributes of the original file
set backup                      " save files after close
set writebackup                 " make a backup of the original file when writing
```


### i3 beautification and setup
- <http://blog.tunnelshade.in/2014/05/making-i3-beautiful.html>
- <https://tribaal.io/using-i3.html>
- <http://askubuntu.com/questions/598943/how-to-de-uglify-i3-wm>


## Richard
- [adjust tmux status line](https://github.com/edkolev/tmuxline.vim)
- [tmux-vim-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [vimux](https://github.com/NickLaMuro/vimux)
- [slime](https://github.com/jpalardy/vim-slime)
- [configure tmux-sessions with tmuxinator](https://github.com/tmuxinator/tmuxinator)
- [Richard's vimrc](https://github.com/oracle2025/.vim)
- [Goyo](https://github.com/junegunn/goyo.vim):  WriteRoom, Distraction-free Writing
- shortcut for toggling status bar for tmux: `bind h set-option -g status`
- `pandoc make` under OSX, PDF-Reader: [Skim](http://skim-app.sourceforge.net/))
- [Space as mapleader](http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
- [git client tig](https://github.com/jonas/tig)


## Other things
### Desktop-Manager

- [herbstluftwm](http://www.herbstluftwm.org/)
- [awesomeWM](http://awesomewm.org/)
  - <https://github.com/awesomeWM/awesome>
- [i3 window manager](https://i3wm.org/)
  - <http://www.guckes.net/Setup/i3-config.2015-10-01>


### Vim: Writing

- [Text Objects](http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/)
- [Your problem with Vim is that you don't grok vi.](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)


## Re-load vimrc when changing it:
```vim
au BufWritePost $MYVIMRC,~/.dotfiles/vimrc,$MYVIMRC.local nested :source $MYVIMRC
```

