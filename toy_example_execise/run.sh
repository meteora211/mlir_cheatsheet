LLVM_REPO_DIR=$(pwd)/../compile/llvm-project
./build/toyc ./tests/ch1.toy -emit=ast &> ./tests/ch1.ast
# $LLVM_REPO_DIR/install/bin/mlir-tblgen -gen-dialect-decls ./include/toy/ToyDialect.td -I $LLVM_REPO_DIR/install/include/
# $LLVM_REPO_DIR/install/bin/mlir-tblgen -gen-dialect-defs ./include/toy/ToyDialect.td -I $LLVM_REPO_DIR/install/include/
# $LLVM_REPO_DIR/install/bin/mlir-tblgen -gen-op-decls ./include/toy/ToyOps.td -I $LLVM_REPO_DIR/install/include/ -I ./include/toy
# $LLVM_REPO_DIR/install/bin/mlir-tblgen -gen-op-defs ./include/toy/ToyOps.td -I $LLVM_REPO_DIR/install/include/ -I ./include/toy
./build/toyc ./tests/codegen.toy -emit=mlir -mlir-print-debuginfo &> ./tests/ch2.mlir
./build/toyc ./tests/ch2.mlir -emit=mlir &> ./tests/ch2.roundtrip.mlir

./build/toyc ./tests/transpose.toy -emit=mlir -opt -mlir-print-debuginfo &> ./tests/ch3_opt_trans.mlir
./build/toyc ./tests/transpose.toy -emit=mlir -mlir-print-debuginfo &> ./tests/ch3_wo_opt_trans.mlir

./build/toyc ./tests/reshape.toy -emit=mlir -opt -mlir-print-debuginfo &> ./tests/ch3_opt_reshape.mlir
./build/toyc ./tests/reshape.toy -emit=mlir -mlir-print-debuginfo &> ./tests/ch3_wo_opt_reshape.mlir
