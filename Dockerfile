FROM archlinux

RUN pacman -Sy && pacman -S emacs --noconfirm

RUN pacman -S git --noconfirm

RUN pacman -S wqy-zenhei  --noconfirm

RUN pacman -S fd ripgrep fzf --noconfirm

RUN pacman -S ispell --noconfirm

ENTRYPOINT emacs
