#!/bin/bash
HOMEPATH=$(pwd)

hugo
cp -r public/* ../khanhkid.github.io/
cd ../khanhkid.github.io
git commit -am "upload new blog"
git push origin master 
cd $HOMEPATH