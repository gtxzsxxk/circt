//===- RTGInterfaces.td - Interfaces used in RTG -----------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef CIRCT_DIALECT_RTG_IR_RTGINTERFACES_TD
#define CIRCT_DIALECT_RTG_IR_RTGINTERFACES_TD

include "mlir/IR/Interfaces.td"

def ContextResourceOpInterface : OpInterface<"ContextResourceOpInterface"> {
  let description = [{
    This interface should be implemented by operations that define
    context resources. The operation should define at least one SSA value of a type
    implementing the `ContextResourceTypeInterface`.
  }];
  let cppNamespace = "::circt::rtg";

  let methods = [
    InterfaceMethod<[{
        Provides a unique identifier for the defined context resource at `idx`
        (not counting op results that are not of a type implementing the
        `ContextResourceTypeInterface`).
        For example, if the context resource are CPUs it could be the core ID.
      }],
      "size_t", "getIdentifier", (ins "size_t":$idx)>,
  ];
}

def ContextResourceTypeInterface : TypeInterface<
    "ContextResourceTypeInterface"> {
  let description = [{
    This interface should be implemented by types that represent context
    resources. The `on_context` operation takes an operand of a type
    implementing this interface or a set of such a type.
    Any operation that creates a value of a type implementing this interface
    must implement the `ContextResourceOpInterface` (does not apply to
    operations that just forward a value of such type).
  }];
  let cppNamespace = "::circt::rtg";
}

#endif // CIRCT_DIALECT_RTG_IR_RTGINTERFACES_TD
