---
title: "My Mac Setup"
date: 2020-03-03T19:46:59Z
---

# Intro

My good friend and colleague, Ricardo Abreu, were working together one day and
he was intrigued by my workflow and what customisations I’ve made to my
terminal/shell to do what I do. I asked how he wanted more info and so here we
are.

Before I delve into it, this is in no way a statement on how to do things. It’s
more how I solve the issues that slow me down or I find frustrating. It’s up to
you as to what concessions you want to make and what matters fit with how you
work. Most of the config for this is in my
[dotfiles](https://github.com/hapana/dotfiles) but be warned, I’ve been pants at
keeping it up to date but the bulk of it is there. That’s another process that
needs fixing.

# The Terminal Emulator

My terminal journey went as follows:

## Built in Mac terminal

Functional. but a pain as a I started to use it more and needed multiple panes
and windows and then organising them was a chore.

## iTerm2/Terminator2

Much better. This was my main driver for years. The windows and panes were a big
productivity boost when I learnt the shortcuts.  I then saw how some colleagues
at the time were using tmux to do the same thing but with more features.
However, I’m a big user of vim (more on that later) and Mac’s have a huge
performance penalty when using tmux and neovim together. The workaround?
Hardware accelerated terminals!

## iTerm2 Nightly/Kitty/Alacritty

I used iTerm2 Nightly for a bit as it had the GPU accelerated feature. However,
I was building up my dotfiles to store in Git and you can’t configure it via
files (that I saw) so on I went to maybe find something a bit fresher. Along
came Kitty and Alacritty. Kitty I tried for a little while. It needed more
handholding for a Mac than alacritty does.  There was bug that made me move but
I forget what it was (I know that’s not very useful). Alacritty has been solid
for me so far. It’s quick, configurable by file that I can commit and keeps me
focused on using tmux features because you can only open one instance of it. I’m
home.

# Shell

The next layer of the cake is the shell. I used bash for a long time, nothing
wrong with it at all. It’s good parts are that it’s everywhere (almost) and
everyone is pretty comfortable using it.

I got introduced to oh-my-zsh a few years ago and switched to it. I don’t
remember the specific reason all those years ago but now, the way it has a
pattern for things like themes,custom include directory and plugins means that
extending it has made big improvements to my workflow. Specifically:

I use the theming to modify my PS1 to display pertinent info. Mostly current
Kubernetes cluster and current git status. Also, my prompt is on a second line.
I use the git and tmux plugins I have a bunch of scripts that contain zsh
functions to make common actions easier to execute and print guides on common
commands.

![pghelp](/my-mac-pghelp.png) This is what it looks like today: Yup, I’m fully
aware I have uncommitted code on master branch.

_One of these days, I’ll contribute the help commands I have back to tldr or
some other similar utility._

A word on Fish. Fish is cool. I like Fish. I tried Fish. Unfortunately, bash
compatiblity is really important to me which is not included in Fish.
Compatibility means I can write scripts that run locally, on servers and in
Docker containers. Fish would mean learning new patters and I struggle enough
with bash as it is :). I took the decision to make my bash better than to
replace it.

# My favourite CLI Apps

I try to live in my shell. The only thing I don’t have in there is my browser,
Slack and some cheeky TextEdits where I may want something temporary but you
know, not Vim temporary. My other most useful apps are here:

## Brew

Brew is a package manager for Mac. Love it. I try not to download DMGs anymore.
I commit a brewfile too so I can share/recreate my environment. Just turn off
autoupdating so it’s a bit quicker when brewing on the fly.

## Tmux

As mentioned before, this is how I do panes and tabs. The other big features I
use are enlarging panes and minimising them and sometimes rotating panes around
if I want one to be bigger for a longer period of time. One thing I really need
to do is to try and reconnect my tmux session on reboot.

Enhancements I’ve made to my setup is to use vim bindings for navigating panes,
remapped the control key to § and installed a couple of useful plugins.

## Vim

Did I mention I use vim? Neovim to be precise. With VimPlug. Notable plugins and
helpers:

- airline
- ale
- nerdtree
- vim-shellcheck
- vim-tmux-navigator

This little snipit to setup aliases:

```
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
```

```
call SetupCommandAlias("spell","set spell spelllang=en_us")
call SetupCommandAlias("readme","set textwidth=80")
```

## ag

Grep is cool and all but ag is quicker and is more purpose built for finding
text in a directory. I can never remember the switches though so I’ve been
meaning to look into `ripgrep` or something like that to see if they’re more
natural to me. Or I’ll write an aghelp.

## z

Z is a cool utility that keeps history on directories you’ve gone too and let’s
you jump to them from anywhere using a fuzzy term. There is a similar utility
called autojump. I find autojump has a better way of knowing which directory you
want to go too. I find z takes the full path into account so if I want to go to
a directory that’s further up a tree, it’ll make to a directory that’s further
down because it’s been referenced more. Autojump did this better but it was
inefficient at keeping it’s index so it made my shell start time too long.

## fuzzyfinder

Reverse search your zsh history is great. Fuzzy searching it is bliss. You don’t
have to be exact so it helps a bunch.

## Docker

I’m a big fan of docker. I use it a lot for testing different bits in something
that’s closer to Linux when required for debugging. Otherwise, I use it for
avoiding stuff locally where it’s not needed. For example, running node
development environments, building Go binaries, testing new tech that will be
due to live in Kubernetes, running a local Kube cluster etc. If it works in
docker locally, it’ll probably work on our clusters.

## Custom functions

As mentioned earlier when talking about oh-my-zsh, I write custom functions in
`~/.oh-my-zsh/custom/` so that I can improve repetetive typing and tasks. I use a
lot of commands for kubernetes, git and lots of periphery ones too. They’ve
helped me a lot.

## sl

What better way to teach you how to type than an unstoppable train rolling
across your screen every time you misstype one of the most common commands in a
terminal.

# Desktop Tools

Okay, I lied, I have three more desktop tools to show you:

## Firefox

I mean, nevermind the recent and questionable privacy focused decisions Google
have made surround Chrome, it’s almost worth it for the fact that you can
cmd-tab between instances. I do miss native profile support but there’s a way
round this with `firefox -p`.  Spectactle: Microsoft’s snapping of Windows is
great. Spectacle offers the same experience and has shortcuts. Makes the desktop
experience a lot nicer. I did think about using a tiled window manager but it’s
too far for me at the moment.

## MTMR

As much as Microsoft did good with Window snapping, Apple did equally as bad
with their typing experience on the latest Macs. I mean:

a. typing is horribly and I fat finger all the time and
b. Because of that a I
keep hitting the touchbar and messing up whatever I’m doing.

MTMR is fantastic. I set a bunch of text as a noop which stops the mistakes but
still retains the 2 finger volume control.

![Touchbary](/my-mac-touchbar.jpeg) _Please Apple. Just a physical escape key.
That’s all I want._

# What am I going to tackle next?

- Dotfiles. I need something to handle dotfiles better than my hokey, non-dry
  scripts. This means I have drift between what I currently implement and what’s
  in git
- Shortcut to switch to the terminal. I currently devote and entire desktop to
  Alacritty and use the three finger mouse swipe to get to it. There might be a
  better option.

# Conclusion

This was a super quick whistle stop tour of my setup. To see how it all ties
together, my dotfiles are the place. Otherwise I hope this has given you some
ideas as to how some of your workflow can be better.

# Links

- [Ag](https://github.com/ggreer/the_silver_searcher)
- [Autojump](https://github.com/wting/autojump)
- [Alacritty](https://github.com/jwilm/alacritty)
- [Brew](https://brew.sh/)
- [Fish](https://fishshell.com/)
- [Fuzzyfinder](https://github.com/junegunn/fzf)
- [Kitty](https://github.com/kovidgoyal/kitty)
- [MTMR](https://github.com/Toxblh/MTMR)
- [Neovim](https://neovim.io)
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [Vim-plug](https://github.com/junegunn/vim-plug)
- [z](https://github.com/rupa/z)
