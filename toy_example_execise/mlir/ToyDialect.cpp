#include "toy/ToyDialect.h"
#include "toy/ToyOps.h"

using namespace mlir;
using namespace mlir::toy;

#include "toy/ToyOpsDialect.cpp.inc"

//===----------------------------------------------------------------------===//
// Toy dialect.
//===----------------------------------------------------------------------===//

void ToyDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "toy/ToyOps.cpp.inc"
      >();
}
