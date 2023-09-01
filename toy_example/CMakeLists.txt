cmake_minimum_required(VERSION 3.10)

project(mlir-example LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 17)

find_package(LLVM CONFIG REQUIRED)
find_package(MLIR CONFIG REQUIRED)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message(STATUS "Found MLIR ${MLIR_PACKAGE_VERSION}")
message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
message(STATUS "Found MLIRTableGen: ${MLIR_TABLEGEN_EXE}")

message(STATUS "LLVM_INCLUDE_DIR include dir: ${LLVM_INCLUDE_DIR}")
message(STATUS "MLIR_INCLUDE_DIR include dir: ${MLIR_INCLUDE_DIR}")

include_directories(${LLVM_INCLUDE_DIR})
include_directories(${MLIR_INCLUDE_DIR})

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(LLVMDistributionSupport)
include(TableGen)
include(AddMLIR)
include(AddLLVM)

# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -fno-rtti")
# macro(add_toy_chapter name)
#   add_dependencies(Toy ${name})
#   add_executable(${name} ${ARGN})
# endmacro(add_toy_chapter name)

add_subdirectory(ch1)
add_subdirectory(ch2)
add_subdirectory(ch3)
# add_subdirectory(ch4)
# add_subdirectory(ch5)
# add_subdirectory(ch6)
# add_subdirectory(ch7)
