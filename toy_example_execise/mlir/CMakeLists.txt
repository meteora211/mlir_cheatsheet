add_mlir_dialect_library(MLIRToy
        ToyDialect.cpp
        ToyOps.cpp
        Rewrite.cpp
        MLIRGen.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/toy

        DEPENDS
        MLIRToyOpsIncGen
        MLIRToyRewriteIncGen

	LINK_LIBS PUBLIC
	MLIRIR
        MLIRInferTypeOpInterface
	)
