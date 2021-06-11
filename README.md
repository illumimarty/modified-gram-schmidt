# *Modified Gram Schmidt Process* - MATLAB Program
![](https://i.imgur.com/rJrjwmi.png)
Image from GeoGebra
### Introduction
The [Gram-Schmidt Process](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process) is an mathematical algorithm that, given *n* linearly independent vectors, will transform them in to a set of orthonormal basis vectors (perpendicular vectors that are a size of 1). On paper, this process is effective. However in the practical computing case, the algorithm is numerically unstable as the matrix size grows due to computational rounding errors. 

The Modified Gram-Schmidt Process provides a much more stable solution that introduces  intermediate steps to minimizes this error. MGS has been tested with random-integer and [Hilbert](https://en.wikipedia.org/wiki/Hilbert_matrix) matrices to demonstrate its effectiveness in numerical stability.

---
### Images
**Graphing orthonormal basis vectors from MGS**
![](https://i.imgur.com/VZITyD4.png)


**CGS vs. MGS with random integer matrices (1<=k<=100)**
![](https://i.imgur.com/yrYJCYj.png)


**CGS vs. MGS with Hilbert matrices (1<=k<=100)**
![](https://i.imgur.com/iE8O2mP.png)



---
### Acknowledgements
I'd like to thank Brandon, Aurora, Leah, and Ambrose for being such an awesome team to work with, Renetian Xiong for the 2D/3D vector plotter ([Source](https://www.mathworks.com/matlabcentral/fileexchange/7470-plot-2d-3d-vector-with-arrowhttps://)), and Professor Rutter for a great semester!
