add_circt_conversion_library(CIRCTArcToLLVM
  LowerArcToLLVM.cpp

  DEPENDS
  CIRCTConversionPassIncGen

  LINK_COMPONENTS
  Core

  LINK_LIBS PUBLIC
  CIRCTArc
  CIRCTComb
  CIRCTSeq
  CIRCTCombToLLVM
  CIRCTHWToLLVM
  MLIRArithToLLVM
  MLIRControlFlowToLLVM
  MLIRFuncToLLVM
  MLIRIndexToLLVM
  MLIRLLVMCommonConversion
  MLIRSCFToControlFlow
  MLIRTransforms
)
