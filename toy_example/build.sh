cmake -S ./ -B `pwd`/build -G Ninja -DLLVM_DIR=/usr/lib/llvm-16/lib/cmake/llvm/ \
  -DMLIR_DIR=/usr/lib/llvm-16/lib/cmake/mlir/
cmake --build `pwd`/build --target all
