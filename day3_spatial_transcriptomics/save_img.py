import scanpy as sc
from scanpy import logging as logg
import pathlib
import imageio
from skimage.util import img_as_ubyte

def save_img(adata, lib_id: str, path: str):

    img_path = path / f"{lib_id}.png"
    logg.warning(f"Saved image at: {img_path}")
    imageio.imwrite(
        img_path,
        img_as_ubyte(adata.uns["spatial"][lib_id]["images"]["hires"]),
    )
    scalef = adata.uns["spatial"][lib_id]["scalefactors"]["tissue_hires_scalef"]
    logg.warning(f"Scalefactor is: {scalef}")
    
    return