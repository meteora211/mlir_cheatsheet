# XXX: use following -DLLVM_DIR and -DLLVM_DIR env to compile if LLVM is manually installed
cmake -S ./ -B `pwd`/build -G Ninja -DCMAKE_BUILD_TYPE=Debug \
-DLLVM_DIR=../compile/llvm-project/install/lib/cmake/llvm/ -DMLIR_DIR=../compile/llvm-project/build/lib/cmake/mlir/
# -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM_ENABLE_LLD=ON
cmake --build `pwd`/build --target all
