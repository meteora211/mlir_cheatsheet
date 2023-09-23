# For a better template to copy, see examples/standalone
cmake_minimum_required(VERSION 3.10)

cmake_policy(SET CMP0116 NEW)
project(toy LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 17)

find_package(LLVM CONFIG REQUIRED)
find_package(MLIR CONFIG REQUIRED)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message(STATUS "Found MLIR ${MLIR_PACKAGE_VERSION}")
message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
message(STATUS "Found MLIRTableGen: ${MLIR_TABLEGEN_EXE}")

message(STATUS "LLVM_INCLUDE_DIR include dir: ${LLVM_INCLUDE_DIRS}")
message(STATUS "MLIR_INCLUDE_DIR include dir: ${MLIR_INCLUDE_DIRS}")

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(TableGen)
include(AddMLIR)
include(AddLLVM)
include(HandleLLVMOptions)

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
include_directories(${PROJECT_SOURCE_DIR}/include)
include_directories(${PROJECT_BINARY_DIR}/include)
link_directories(${LLVM_BUILD_LIBRARY_DIR})
add_definitions(${LLVM_DEFINITIONS})

# fix llvm::cl undefined reference
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -fno-rtti")

add_subdirectory(include)
add_subdirectory(mlir)


# get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
# get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
# set(LIBS
#         ${dialect_libs}
#         ${conversion_libs}
#         MLIRArithDialect
#         MLIROptLib
#         MLIRToy
#         )
# add_llvm_executable(toyc toyc.cpp parser/AST.cpp)

# llvm_update_compile_flags(toyc)
# target_link_libraries(toyc PRIVATE ${LIBS})

# mlir_check_all_link_libraries(toyc)
get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
set(LIBS
    ${dialect_libs}
    ${conversion_libs}
    MLIRArithDialect
    MLIROptLib
    MLIRToy
    MLIRAnalysis
    MLIRCallInterfaces
    MLIRCastInterfaces
    MLIRExecutionEngine
    MLIRIR
    MLIRLLVMCommonConversion
    MLIRLLVMDialect
    MLIRLLVMToLLVMIRTranslation
    MLIRMemRefDialect
    MLIRParser
    MLIRPass
    MLIRSideEffectInterfaces
    MLIRSupport
    MLIRTargetLLVMIRExport
    MLIRTransforms
)

add_executable(toyc
  toyc.cpp
  parser/AST.cpp
)


include_directories(include/)
target_link_libraries(toyc
  PRIVATE
  ${LIBS}
)
