#!/bin/bash
HOMEPATH=$(pwd)
GITHUGOPATH=$(git remote -v | grep push)
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "${GREEN}>> Generate static html${NC}"
hugo
echo "${GREEN}>> Push content of post to GitHub: $GITHUGOPATH ${NC}"
git add .
git commit -am "update new blog"
git push origin master 
echo "${GREEN}>> Pushed content of post"

cd ../../
GITHUGOPATH=$(git remote -v | grep push)
echo "${GREEN}>> Push New Content of post to GitHub: $GITHUGOPATH ${NC}"
git add .
git commit -am "upload new blog"
git push origin master 
echo "${GREEN}>> Pushed new blog${NC}"
cd $HOMEPATH