//===- Ops.td - Toy dialect operation definitions ----------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Defines the operations of the Toy dialect.
//
//===----------------------------------------------------------------------===//

#ifndef TOY_DIALECT
#define TOY_DIALECT

include "mlir/IR/DialectBase.td"

def Toy_Dialect : Dialect {
  let name = "toy";
  let summary = "A high-level dialect for analyzing and optimizing the "
                "Toy language";
  let description = [{
    The Toy language is a tensor-based language that allows you to define
    functions, perform some math computation, and print results. This dialect
    provides a representation of the language that is amenable to analysis and
    optimization.
  }];
  let cppNamespace = "::mlir::toy";
}

#endif // TOY_DIALECT
