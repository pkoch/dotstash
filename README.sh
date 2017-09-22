DIRNAME=$(python -c "import os,sys; print os.path.realpath(sys.argv[1])" $(dirname $0))

for COPIED in \
    'gitconfig' \
    'gitconfig-lom' \
    'hgrc' \
; do
    cp $COPIED $HOME/.$COPIED
done


cd $HOME
for LINKED in \
    'ackrc' \
    'aliases' \
    'general_exports' \
    'profile' \
    'vim' \
; do
    ln -s $DIRNAME/$LINKED .$LINKED
done

mkdir -p $HOME/.gnupg
ln -s $DIRNAME/gpg.conf $HOME/.gnupg/

echo "Don't forget to source ~/.profile"
echo "Consider running `crontab $DIRNAME/crontab`"
