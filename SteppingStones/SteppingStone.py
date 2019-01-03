from PIL import Image
import numpy as np

img = Image.open("bnw.png")
img_arr = np.asarray(img)
print(img_arr)