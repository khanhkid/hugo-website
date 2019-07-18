#!/bin/bash
HOMEPATH=$(pwd)
GITHUGOPATH=$(git remote show origin)

echo ">> Generate static html"
hugo
echo ">> Push content of post to GitHub: $GITHUGOPATH"
git commit -am "update new blog"
git push origin master 
echo ">> Pushed content of post"

cd ../../
GITHUGOPATH=$(git remote show origin)
echo ">> Push New Content of post to GitHub: $GITHUGOPATH"
git commit -am "upload new blog"
git push origin master 
echo ">> Pushed new blog"
cd $HOMEPATH