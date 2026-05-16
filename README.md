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

## System requirements
Tested on macos arm and linux osx64. On macos, ran out of memory halfway through. Successfully tested on HPC requesting 200GB of memory. This could be optimised for less, but I haven't tested how low I can go in terms of memory. I reserved 4 hours, but development and testing took around an hour. I would recommend 2 hours.

### Tested SLURM request in dev
```
srun --time=04:00:00 --mem=200G -A <ACCOUNT> -p icelake --pty /bin/bash
```

## Usage 

```
# Install pixi
curl -fsSL https://pixi.sh/install.sh | bash

# Clone repo and change directory
git clone git@github.com:dgrfs/HCATonsil_to_h5ad.git && cd HCATonsil_to_h5ad

# Ensure that $TEMP is defined 
export TMP=/rds/project/rds-CBhaM9mB5fs/$USER/tmp

# Run pixi pipeline (workflow described in pixi.toml)
pixi run pipeline
```
