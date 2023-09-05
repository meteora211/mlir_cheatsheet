#! /bin/bash

# chpt1
./build/ch1/toyc-ch1 ./ch1/ch1.toy -emit=ast &> ch1.ast

# chpt2
# use following command to see generated sources:
# /usr/local/opt/llvm/bin/mlir-tblgen -gen-op-decls ./ch2/include/toy/Ops.td -I /usr/local/opt/llvm/include/
# /usr/local/opt/llvm/bin/mlir-tblgen -gen-op-defs ./ch2/include/toy/Ops.td -I /usr/local/opt/llvm/include/
# /usr/local/opt/llvm/bin/mlir-tblgen -gen-dialect-decls ./ch2/include/toy/Ops.td -I /usr/local/opt/llvm/include/
# /usr/local/opt/llvm/bin/mlir-tblgen -gen-dialect-defs ./ch2/include/toy/Ops.td -I /usr/local/opt/llvm/include/
./build/ch2/toyc-ch2 ./ch2/codegen.toy -emit=mlir -mlir-print-debuginfo &> ch2.mlir
./build/ch2/toyc-ch2 ./ch2.mlir -emit=mlir &> ch2.roundtrip.mlir

# chpt3
# /usr/local/opt/llvm/bin/mlir-tblgen -gen-rewriters ./ch3/mlir/ToyCombine.td -I /usr/local/opt/llvm/include/
# NOTE: implemented in ToyCombine.cpp
./build/ch3/toyc-ch3 ./ch3/transpose.toy -emit=mlir -opt -mlir-print-debuginfo &> ch3_opt_trans.mlir
./build/ch3/toyc-ch3 ./ch3/transpose.toy -emit=mlir -mlir-print-debuginfo &> ch3_wo_opt_trans.mlir

# NOTE: implemented in ToyCombine.td
./build/ch3/toyc-ch3 ./ch3/reshape.toy -emit=mlir -opt -mlir-print-debuginfo &> ch3_opt_reshape.mlir
./build/ch3/toyc-ch3 ./ch3/reshape.toy -emit=mlir -mlir-print-debuginfo &> ch3_wo_opt_reshape.mlir

#chpt4
./build/ch4/toyc-ch4 ./ch4/inline.toy -emit=mlir -mlir-print-debuginfo &> ch4_wo_opt.mlir
./build/ch4/toyc-ch4 ./ch4/inline.toy -emit=mlir -opt -mlir-print-debuginfo &> ch4_inline_only.mlir
./build/ch4/toyc-ch4 ./ch4/inline.toy -emit=mlir -opt -infer-shape -mlir-print-debuginfo &> ch4_inline_infer_shape.mlir

#chpt5
./build/ch5/toyc-ch5 ./ch5/convert.toy -opt -emit=mlir -mlir-print-debuginfo &> ch5_origin.mlir
./build/ch5/toyc-ch5 ./ch5/convert.toy -opt -emit=mlir-affine -mlir-print-debuginfo &> ch5_affine.mlir

#chpt6
./build/ch6/toyc-ch6 ./ch6/convert.toy -opt -emit=mlir -mlir-print-debuginfo &> ch6_origin.mlir
./build/ch6/toyc-ch6 ./ch6/convert.toy -opt -emit=mlir-llvm -mlir-print-debuginfo &> ch6_mlir_llvm.mlir
./build/ch6/toyc-ch6 ./ch6/convert.toy -opt -emit=llvm -mlir-print-debuginfo &> ch6_llvm.mlir
echo 'def main() { print([[1, 2], [3, 4]]); }' | ./build/ch6/toyc-ch6 -emit=jit

#chpt7
./build/ch7/toyc-ch7 ./ch7/struct.toy -opt -emit=mlir -mlir-print-debuginfo &> ch7_struct.mlir
