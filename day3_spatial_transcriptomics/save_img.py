import scanpy as sc
from scanpy import logging as logg
import pathlib
import imageio
from skimage.util import img_as_ubyte

LIB_ID = "V10F24-105_A1"
path = pathlib.Path("/Users/giovanni.palla/Datasets/advomics/advomics_data")
st_adata = sc.read(path / f"{LIB_ID}.h5ad"")

img_path = path / f"{LIB_ID}.png"
logg.warning(f"Saved image at: {img_path}")
imageio.imwrite(
    img_path,
    img_as_ubyte(st_adata.uns["spatial"][LIB_ID]["images"]["hires"]),
)
scalef = st_adata.uns["spatial"][LIB_ID]["scalefactors"]["tissue_hires_scalef"]
logg.warning(f"Scalefactor is: {scalef}")