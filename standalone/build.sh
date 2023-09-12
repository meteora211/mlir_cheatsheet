REPO_DIR=$(pwd)/../compile/llvm-project
mkdir build

echo $REPO_DIR
cmake -G Ninja -B `pwd`/build \
  -DLLVM_EXTERNAL_LIT=$REPO_DIR/build/bin/llvm-lit \
  -DLLVM_DIR=$REPO_DIR/build/lib/cmake/llvm/ \
  -DMLIR_DIR=$REPO_DIR/build/lib/cmake/mlir/ \
  -DMLIR_ENABLE_BINDINGS_PYTHON=ON \
  -DPython3_EXECUTABLE=$(which python)

cmake --build `pwd`/build --target check-standalone
