#!/bin/bash

FILE_LIST="/home/pkroliko/git/hl_files.out"
PROJ="/home/pkroliko/git/PROJ-Playtech"
CSCOPE_DB="/home/pkroliko/git/hl_cscope.out"
export CSCOPE_DB

pushd / > /dev/null

echo -ne "Generating file list..."

find $PROJ -name "*.py" -o -name "*.cfg" > $FILE_LIST

FILES=`wc -l ${FILE_LIST} | cut -f 1 -d " "`
echo "  ${FILES} files found"

echo "Creating cscope database..."

pycscope.py -i $FILE_LIST -f ${CSCOPE_DB}

echo "export CSCOPE_DB=\"${CSCOPE_DB}\"" > ~/.bash/cscope.sh

popd > /dev/null

echo "Done"
