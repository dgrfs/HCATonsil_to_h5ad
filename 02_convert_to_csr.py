import scanpy as sc

adata = sc.read_h5ad("sce_min.h5ad")
adata.X = adata.X.astype("float32")
adata.write_h5ad("sce_min_ready.h5ad", compression="gzip")
