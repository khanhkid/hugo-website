#!/bin/bash
HOMEPATH=$(pwd)
GITHUGOPATH=$(git remote -v | grep push)
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "${RED}>> Generate static html"
hugo
echo "${RED}>> Push content of post to GitHub: $GITHUGOPATH"
git add .
git commit -am "update new blog"
git push origin master 
echo "${RED}>> Pushed content of post"

cd ../../
GITHUGOPATH=$(git remote -v | grep push)
echo "${RED}>> Push New Content of post to GitHub: $GITHUGOPATH"
git add .
git commit -am "upload new blog"
git push origin master 
echo "${RED}>> Pushed new blog"
cd $HOMEPATH