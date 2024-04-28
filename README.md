# Vim syntax highlighting for morloc

Run the following in your UNIX terminal

```
mkdir -p ~/.vim/syntax/
mkdir -p ~/.vim/ftdetect/
cp loc.vim ~/.vim/syntax/
echo 'au BufRead,BufNewFile *.loc set filetype=loc' > ~/.vim/ftdetect/loc.vim
```
