#!/bin/bash
# Copyright 2015 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
P=$(cd $(dirname $0) && pwd)
COMMON=$P/../common

MAX_LEN=16
MAX_TOTAL_TIME=7200
BUCKET=gs://re-fuzzing-corpora
CORPUS=CORPORA/C1
ARTIFACTS=CORPORA/ARTIFACTS
BUILD_SH=$P/build.sh

SAN=-fsanitize=address
COV=-fsanitize-coverage=edge,8bit-counters
USE_COUNTERS=1
LIBFUZZER_EXTRA_FLAGS=-drill=1

TARGET_NAME=re2

update_trunk() {
  if [ -d re2 ]; then
    (cd re2 && git pull)
  else
    git clone https://github.com/google/re2.git
  fi
}

source $COMMON/loop_body.sh
