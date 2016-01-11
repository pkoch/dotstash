DIRNAME=$(python -c "import os,sys; print os.path.realpath(sys.argv[1])" $(dirname $0))

for COPIED in \
    'gitconfig' \
    'hgrc' \
; do
    cp $COPIED $HOME/.$COPIED
done

cd $HOME
for LINKED in \
    'vim' \
    'shell_prompt.sh' \
    'profile' \
    'ackrc' \
; do
    ln -s $DIRNAME/$LINKED .$LINKED
done

echo "Don't forget to source ~/.profile"
