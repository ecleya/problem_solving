# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/scipy-notebook

LABEL maintainer="ecleya <ecleya@gmail.com>"


# Install Algospot Kernel
RUN conda update -y conda && \
    conda create -y --name algospot.python python=3.4.3 ipykernel && \
    /bin/bash -c "source activate algospot.python" && \
    pip install requests termcolor beautifulsoup4 && \
    python -m ipykernel install --user --name "algospot.python" && \
    /bin/bash -c "source deactivate"

# Install Keras Kernel
RUN conda create -y --name keras python=3.6.2 ipykernel && \
    /bin/bash -c "source activate keras" && \
    pip install keras tensorflow && \
    python -m ipykernel install --user --name "keras" && \
    /bin/bash -c "source deactivate"

# Install Cling Kernel
RUN conda create -y --name algospot.cpp cling && \
    /bin/bash -c "source activate algospot.cpp" && \
    jupyter-kernelspec install /opt/conda/envs/algospot.cpp/share/cling/Jupyter/kernel/cling-cpp11 --user --name=algospot.cpp && \
    /bin/bash -c "source deactivate"
