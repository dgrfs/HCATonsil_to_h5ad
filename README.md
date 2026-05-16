# Seurat to h5ad

Converting from Seurat object to h5ad. This is for the HTA human tonsil atlas data. Taking the raw counts and the annotations in a h5ad object so that I can train an scvi model. This can be used as an alternate method for annotation of our scRNA data.

# Tonsil atlas data

## Zenodo

```
wget https://zenodo.org/records/8373756/files/TonsilAtlasSeuratRNA.tar.gz
```
From this, we can use

```
20230911_tonsil_atlas_rna_seurat_obj.rds
```

I need the seurat object, not the matrix objects, because I want to extract the annotations alongside the raw counts.


## HCATonsil package

This is the easiest to download the annotated data


# Pixi package manager and sce conversion pipeline

## Usage 

```
curl -fsSL https://pixi.sh/install.sh | bash
git clone <your-repo> && cd <your-repo>
pixi run pipeline
```
