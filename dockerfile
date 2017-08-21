# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/scipy-notebook

MAINTAINER ecleya <ecleya@gmail.com>


# Install Algospot Kernel
RUN conda update conda && \
    conda create -y --name algospot python=3.4.3 ipykernel && \
    /bin/bash -c "source activate algospot" && \
    pip install requests termcolor beautifulsoup4 && \
    python -m ipykernel install --user --name "algospot" && \
    /bin/bash -c "source deactivate"

# Install Keras Kernel
RUN conda create -y --name keras python=3.6.2 ipykernel && \
    /bin/bash -c "source activate keras" && \
    pip install keras tensorflow && \
    python -m ipykernel install --user --name "keras" && \
    /bin/bash -c "source deactivate"
