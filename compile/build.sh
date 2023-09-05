# sudo apt-get install clang lld
REPO_DIR=./llvm-project
BUILD_DIR=./llvm-project/build
INSTALL_DIR=./llvm-project/install
git clone -b release/16.x https://github.com/llvm/llvm-project.git
mkdir -p $BUILD_DIR 
cmake -G Ninja "-S $REPO_DIR/llvm" \
   -B $BUILD_DIR \
   -DLLVM_ENABLE_PROJECTS=mlir \
   -DLLVM_BUILD_EXAMPLES=ON \
   -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU" \
   -DCMAKE_BUILD_TYPE=Debug \
   -DLLVM_ENABLE_ASSERTIONS=ON \
   -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
   -DMLIR_INCLUDE_INTEGRATION_TESTS=OFF \
   -DLLVM_INCLUDE_TOOLS=ON
# Using clang and lld speeds up the build, we recommend adding:
# -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM_ENABLE_LLD=ON
# CCache can drastically speed up further rebuilds, try adding:
#  -DLLVM_CCACHE_BUILD=ON
# Optionally, using ASAN/UBSAN can find bugs early in development, enable with:
# -DLLVM_USE_SANITIZER="Address;Undefined" 
# Optionally, enabling integration tests as well
# -DMLIR_INCLUDE_INTEGRATION_TESTS=ON
cmake --build $BUILD_DIR --target install
