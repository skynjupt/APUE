#!/bin/bash

PATH_ROOT=../
cd $PATH_ROOT
ROOTPATH=$(pwd)

echo LOCAL_BASE = $ROOTPATH
echo LOCAL_BASE = $ROOTPATH > path.def

echo " " >> path.def
echo BASE_DIR = \$\{LOCAL_BASE\} >> path.def
echo INC_DIR = \$\{BASE_DIR\}/inc >> path.def
echo SRC_DIR = \$\{BASE_DIR\}/src >> path.def
echo RULES_DIR = \$\{BASE_DIR\}/rules >> path.def
echo LIB_DIR = \$\{BASE_DIR\}/lib >> path.def

cp path.def src/
rm -f path.def
