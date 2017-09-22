DIRNAME=$(python -c "import os,sys; print os.path.realpath(sys.argv[1])" $(dirname $0))

for COPIED in \
    'gitconfig' \
    'gitconfig-lom' \
    'hgrc' \
; do
    cp $COPIED $HOME/.$COPIED
done

mkdir $HOME/.gnupg
cp gpg.conf $HOME/.gnupg/

cd $HOME
for LINKED in \
    'vim' \
    'profile' \
    'ackrc' \
    'aliases' \
    'general_exports' \
; do
    ln -s $DIRNAME/$LINKED .$LINKED
done

echo "Don't forget to source ~/.profile"
