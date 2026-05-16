import scanpy as sc
import scipy.sparse as sp

adata = sc.read("sce_min.h5ad")

# Ensure float32 (scvi requirement)
if adata.X.dtype != "float32":
    adata.X = adata.X.astype("float32")

sc.write(adata, "sce_min_ready.h5ad", compression="gzip")