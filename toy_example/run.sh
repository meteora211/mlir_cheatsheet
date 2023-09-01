#! /bin/bash

# chpt1
./build/ch1/toyc-ch1 ./ch1/ch1.toy -emit=ast &> ch1.ast

# chpt2
# use following command to see generated sources:
# /usr/local/opt/llvm/bin/mlir-tblgen -gen-op-defs ./ch2/include/toy/Ops.td -I /usr/local/opt/llvm/include/
# /usr/local/opt/llvm/bin/mlir-tblgen -gen-op-defs ./ch2/include/toy/Ops.td -I /usr/local/opt/llvm/include/
# /usr/local/opt/llvm/bin/mlir-tblgen -gen-op-decls ./ch2/include/toy/Ops.td -I /usr/local/opt/llvm/include/
# /usr/local/opt/llvm/bin/mlir-tblgen -gen-op-defs ./ch2/include/toy/Ops.td -I /usr/local/opt/llvm/include/
./build/ch2/toyc-ch2 ./ch2/codegen.toy -emit=mlir -mlir-print-debuginfo &> ch2.mlir
./build/ch2/toyc-ch2 ./ch2.mlir -emit=mlir &> ch2.roundtrip.mlir
