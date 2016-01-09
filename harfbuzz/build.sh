#!/bin/bash
export PATH="$HOME/llvm-build/bin:$PATH"
NAME=$1 # E.g. asan
SAN=$2  # E.g. -fsanitize=address
COV=$3  # E.g. -fsanitize-coverage=edge,8bit-counters
(
rm -rf $NAME
cp -rf harfbuzz $NAME
cd $NAME
./autogen.sh
FLAGS=" $SAN $COV -g"
CXX="clang++ $FLAGS"  CC="clang $FLAGS" CCLD="clang++ $FLAGS" ./configure --enable-static --disable-shared
make -j -C src fuzzing
)
ln -sf $HOME/llvm/lib/Fuzzer .
for f in Fuzzer/*cpp; do clang++ -std=c++11 -c $f -IFuzzer & done
wait
clang++ -g -std=c++11 harfbuzz/test/fuzzing/hb-fuzzer.cc $SAN $COV -I $NAME -I $NAME/src ./$NAME/src/.libs/libharfbuzz-fuzzing.a -lglib-2.0 Fuzzer*.o -o harfbuzz_${NAME}_fuzzer
#clang++ -g -std=c++11 harfbuzz/test/fuzzing/hb-fuzzer.cc $SAN $COV -I $NAME -I $NAME/src ./$NAME/src/.libs/libharfbuzz.a -lglib-2.0 -DMAIN=main -o harfbuzz_${NAME}_run
