import scanpy as sc
from scanpy import logging as logg
import pathlib
import imageio
from skimage.util import img_as_ubyte

LIB_ID = "V10F24-105_A1"
root = pathlib.Path("/Users/giovanni.palla/Datasets/advomics")
st_adata = sc.read(root / f"spatial_adata/{LIB_ID}.h5ad")

img_path = root / f"{LIB_ID}.png"
logg.warning(f"Saved image at: {img_path}")
imageio.imwrite(
    img_path,
    img_as_ubyte(st_adata.uns["spatial"]["V10F24-105_A1"]["images"]["hires"]),
)
scalef = st_adata.uns["spatial"]["V10F24-105_A1"]["scalefactors"]["tissue_hires_scalef"]
logg.warning(f"Scalefactor is: {scalef}")