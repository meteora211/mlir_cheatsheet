#include "mlir/IR/Matchers.h"
#include "mlir/IR/PatternMatch.h"
#include "toy/ToyOps.h"
#include <numeric>
using namespace mlir;
using namespace toy;

namespace {
/// Include the patterns defined in the Declarative Rewrite framework.
#include "toy/ToyRewrite.h.inc"
} // namespace

struct FuseTransposePattern : public mlir::OpRewritePattern<TransposeOp> {
  FuseTransposePattern(mlir::MLIRContext *context)
      : OpRewritePattern<TransposeOp>(context, /*benefit=*/1) {}

  mlir::LogicalResult
  matchAndRewrite(TransposeOp op,
                  mlir::PatternRewriter &rewriter) const override {
    mlir::Value transposeInput = op.getOperand();
    TransposeOp transposeInputOp = transposeInput.getDefiningOp<TransposeOp>();
    if (!transposeInputOp) {
      return failure();
    }
    rewriter.replaceOp(op, {transposeInputOp.getOperand()});
    return success();
  }
};

void TransposeOp::getCanonicalizationPatterns(RewritePatternSet &result,
                                              MLIRContext *context) {
  result.add<FuseTransposePattern>(context);
}

void ReshapeOp::getCanonicalizationPatterns(RewritePatternSet &result,
                                          MLIRContext *context) {
  result.add<ReshapeReshapeOptPattern, FoldConstantReshapeOptPattern,
             RedundantReshapeOptPattern>(context);
}
