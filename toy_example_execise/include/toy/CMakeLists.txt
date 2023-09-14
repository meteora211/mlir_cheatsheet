# set(LLVM_TARGET_DEFINITIONS Dialect.td)
# XXX: use ToyOps not ToyDialect!
add_mlir_dialect(ToyOps toy)
add_mlir_doc(ToyDialect ToyDialect toy/ -gen-dialect-doc)
add_mlir_doc(ToyOps ToyOps toy/ -gen-op-doc)
