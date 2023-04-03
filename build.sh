#!/usr/bin/env bash

declare -r TABAC="dev/tabac"
declare -r OUT="out"
declare -r BIN="bin"
declare -r TESTNIX="test_unix"
declare -r OUTNIX="$OUT/$TESTNIX"
declare -r TESTINO="test_arduino"
declare -r OUTINO="$OUT/$TESTINO"
declare -r BOARDINO="arduino:avr:uno"

function SETUP() {
  echo $(date +%F_%T)
  rm -rf $BIN
  mkdir -p $BIN
  mkdir -p $BIN/$TESTNIX
  mkdir -p $BIN/$TESTINO
  rm -rf $OUT
  mkdir -p $OUT/src
  mkdir -p $OUTNIX
  mkdir -p $OUTINO
}

function TRANSPILE() {
	$TABAC $1 $2
	if [ $? -ne 0 ]
  then
    echo "error transpiling $1" >&2
    exit 1
  fi
}

function COMPILENIX() {
  cp -r $OUT/src $OUTNIX/src
  gcc -v -include $OUTNIX/src/avimac.cpp $OUTNIX/$TESTNIX.cpp -o $BIN/$TESTNIX/$TESTNIX 2>&1
	if [ $? -ne 0 ]
  then
    echo "error compiling $TESTNIX" >&2
    exit 1
  fi
}

function COMPILEINO() {
  cp -r $OUT/src $OUTINO/src
  arduino-cli compile -v --export-binaries --fqbn $BOARDINO $OUTINO/$TESTINO.ino 2>&1
	if [ $? -ne 0 ]
  then
    echo "error compiling $TESTINO" >&2
    exit 1
  fi
  mv $OUTINO/build/* $BIN/$TESTINO
}

echo "% setting up ..."
SETUP
echo "% transpiling tabac ..."
TRANSPILE src/avimac_header.tabah $OUT/src/avimac.h
TRANSPILE src/avimac_instructions.tabah $OUT/src/avimac_instructions.h
TRANSPILE src/avimac_implementation.tabac $OUT/src/avimac.cpp
TRANSPILE test/test_avimac.tabah $OUT/src/test_avimac.h
TRANSPILE test/$TESTINO.tabac $OUTINO/$TESTINO.ino
TRANSPILE test/$TESTNIX.tabac $OUTNIX/$TESTNIX.cpp
echo "% compiling tests ..."
COMPILENIX
COMPILEINO

