add_mlir_dialect_library(MLIRToy
        ToyDialect.cpp
        ToyOps.cpp
        Rewrite.cpp
        MLIRGen.cpp
        ShapeInferencePass.cpp
        LowerToAffineLoops.cpp
        LowerToLLVM.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/toy

        DEPENDS
        MLIRToyOpsIncGen
        MLIRToyRewriteIncGen
        MLIRShapeInferenceInterfaceIncGen

	LINK_LIBS PUBLIC
	MLIRIR
        MLIRInferTypeOpInterface
	)
