library(SingleCellExperiment)
library(Matrix)
library(DelayedArray)
library(HCATonsilData)
library(zellkonverter)
library(SummarizedExperiment)

sc_object <- HCATonsilData(assayType = "RNA",
              cellType = "All",
              processedCounts = TRUE)

cat("Dimensions:", dim(sc_object), "\n")

counts_mat <- assay(sc_object, "counts")
cat("counts class:", class(counts_mat), "\n")

counts_sparse <- as(counts_mat, "dgCMatrix")
cat("Realized class:", class(counts_sparse), "\n")

sce_min <- SingleCellExperiment(
  assays  = list(counts = counts_sparse),
  colData = colData(sc_object),
  rowData = rowData(sc_object)[, c("gene_id", "gene_name")]
)

cat("Writing h5ad...\n")
writeH5AD(
  sce_min,
  file        = "sce_min.h5ad",
  X_name      = "counts",
  compression = "gzip"
)

cat("Done.\n")