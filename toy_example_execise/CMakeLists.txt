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

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(LLVMDistributionSupport)
include(TableGen)
include(AddMLIR)
include(AddLLVM)

set(LLVM_LINK_COMPONENTS
  Support
)

add_executable(toyc
  toyc.cpp
  parser/AST.cpp
)

include_directories(include/)
target_link_libraries(toyc
  PRIVATE
  MLIRSupport)
