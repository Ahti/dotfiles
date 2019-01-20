# these are here so they are synced with my dotfiles
# so they do not need to be set on every machine
set -x NVIM_TUI_ENABLE_TRUE_COLOR 1
set -x NVIM_TUI_ENABLE_CURSOR_SHAPE 1

set -g theme_display_user yes
set -g default_user lukas

set -x LANG en_US.UTF-8
set -x EDITOR nvim

function __tmux_update_env --on-event fish_preexec
    # if in tmux, reload SSH_AUTH_SOCK and DISPLAY
    # before each command is run
    test ! -z "$TMUX"; and eval (tmux show-env -s | grep 'SSH_AUTH_SOCK=\|DISPLAY=' | sed 's/^/export /g')
end

# only if we're reasonably sure we're running on arch
if uname -r | grep ARCH >/dev/null
    # use paths from /etc/profile.d
    env -i HOME=$HOME sh -l -c 'export -p' | sed -e "/PATH/s/\"//g;/PATH/s/:/ /g;s/=/ /;s/^export/set -x/;/^set -x PATH /!d" | source
end

if test -d ~/.cargo/bin
    set PATH ~/.cargo/bin $PATH
end

if test -d ~/.bin
    set PATH ~/.bin $PATH
end

if test -d /usr/local/sbin
    set PATH $PATH /usr/local/sbin
end

if which gem >/dev/null ^/dev/null
    set -l p (ruby -r rubygems -e 'puts Gem.user_dir')/bin
    if test -d $p
        set PATH $PATH $p
    end
end
