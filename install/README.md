# ubuntu installation

https://apt.llvm.org/

```
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
# or
wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | sudo tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421

# To install just clang, lld and lldb (16 release): 
apt-get install clang-16 lldb-16 lld-16
# LLVM
apt-get install libllvm-16-ocaml-dev libllvm16 llvm-16 llvm-16-dev llvm-16-doc llvm-16-examples llvm-16-runtime
# mlir
apt-get install libmlir-16-dev mlir-16-tools
```
