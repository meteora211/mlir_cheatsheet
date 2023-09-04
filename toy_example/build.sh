cmake -S ./ -B `pwd`/build -G Ninja
# XXX: use following env compile if LLVM is manually installed
# -DLLVM_DIR=/usr/lib/llvm-16/lib/cmake/llvm/ -DMLIR_DIR=/usr/lib/llvm-16/lib/cmake/mlir/
cmake --build `pwd`/build --target all
