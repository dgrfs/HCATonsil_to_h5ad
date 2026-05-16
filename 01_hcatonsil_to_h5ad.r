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

# Keep counts as a lazy DelayedArray — do NOT realize it
counts_mat <- assay(sc_object, "counts")
cat("counts class:", class(counts_mat), "\n")

# Tell DelayedArray to use small blocks so it never allocates the full matrix
setAutoBlockSize(1e9)   # 1 GB per block — tune down if still OOM

sce_min <- SingleCellExperiment(
  assays  = list(counts = counts_mat),  # still lazy
  colData = colData(sc_object),
  rowData = rowData(sc_object)[, c("gene_id", "gene_name")]
)

# writeH5AD streams the DelayedArray in blocks internally
cat("Writing h5ad...\n")
writeH5AD(
  sce_min,
  file        = "sce_min.h5ad",
  X_name      = "counts",
  compression = "gzip"
)

cat("Done.\n")