git submodule update --init --recursive

cp ackrc ../.ackrc
cp gitconfig ../.gitconfig
cp hgrc ../.hgrc

ln -s ~/dotstash/sublime_text_2 ~/Library/Application Support/Sublime Text 2/Packages/User

cd ..
ln -s dotstash/vim .vim
ln -s .vim/vimrc .vimrc
