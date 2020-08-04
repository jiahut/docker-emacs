FROM archlinux

RUN pacman -Syu  --needed --noconfirm

# RUN pacman -Syu --needed --noconfirm \
#   base-devel \
#   git

RUN pacman -S emacs \
              git \
              wqy-zenhei \
              fd \
              ripgrep \
              fzf \
              ispell \
              diffutils \
              --noconfirm

# COPY libx11-1.6.10-2-x86_64.pkg.tar.zst  /tmp/

# RUN pacman -U /tmp/libx11-1.6.10-2-x86_64.pkg.tar.zst --noconfirm


# create user and workdir
# ARG user=jazz

# RUN groupadd  $user --gid 1001 \
#  && useradd -m $user --uid 1000 -g $user \
#  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user

# USER $user
# WORKDIR /home/$user

# RUN sudo pacman -S emacs  wqy-zenhei fd ripgrep fzf ispell diffutils --noconfirm

ENTRYPOINT emacs
