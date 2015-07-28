# Setup Golang
* curl -sKS -L http://git.io/vYHHu | bash
* rebuild ycm with gocode now installed (if using https://github.com/metral/vimrc)
  * pushd ~/.vim
  * ./build_ycm.sh
  * popd
* in GB golang project create symlink to allow gocode to detect gb pkg's:
  * pushd <golang_proj>/pkg
  * ln -s linux/amd64 linux_amd64
  * popd
  * ~/gbimports
