#!/bin/bash
HOMEPATH=$(pwd)
GITHUGOPATH=$(git remote -v | grep push)

echo ">> Generate static html"
hugo
echo ">> Push content of post to GitHub: $GITHUGOPATH"
git add .
git commit -am "update new blog"
git push origin master 
echo ">> Pushed content of post"

cd ../../
GITHUGOPATH=$(git remote -v | grep push)
echo ">> Push New Content of post to GitHub: $GITHUGOPATH"
git add .
git commit -am "upload new blog"
git push origin master 
echo ">> Pushed new blog"
cd $HOMEPATH