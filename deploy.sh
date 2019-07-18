#!/bin/bash
HOMEPATH=$(pwd)

hugo
git commit -am "update new blog"
git push origin master 
cd ../../
git commit -am "upload new blog"
git push origin master 
cd $HOMEPATH