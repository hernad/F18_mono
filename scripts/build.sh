#!/bin/bash


if node --version | grep -q v12 ; then 
   echo nodejs v12  - OK
else
   echo nodejs NOT v12 - ERR ?!
   exit 1
fi

echo === vscode postgres ==
cd vscode-postgres
yarn install
yarn compile
cd ..

echo === vscode pdf-view ==
cd vscode-pdf-view
yarn
yarn compile
cd ..

echo === vscode f18 ==
cd vscode-f18
yarn
yarn build
cd ..