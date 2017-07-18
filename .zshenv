typeset -U path
path=(~/bin $path[@])

#Rust
export PATH=${PATH}:${HOME}/.cargo/bin
export RUST_SRC_PATH=/usr/src/rust/src

#Editors
export EDITOR='nvim'
export VISUAL='nvim'
