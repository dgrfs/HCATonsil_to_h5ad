import scanpy as sc

adata = sc.read_h5ad("sce_min.h5ad", backed="r")

if adata.X.dtype != "float32":
    # Can't cast in-place in backed mode — write with conversion
    adata.X = adata.X.astype("float32")  # only runs if small enough

adata.write_h5ad("sce_min_ready.h5ad", compression="gzip")