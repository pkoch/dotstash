git submodule update --init --recursive

cp ackrc ../.ackrc
cp gitconfig ../.gitconfig
cp hgrc ../.hgrc

ln -s ../.vim vim
ln -s ../.vimrc ../.vim/vimrc

ln -s ~/dotstash/sublime_text_2 ~/Library/Application Support/Sublime Text 2/Packages/User
