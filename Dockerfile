FROM continuumio/miniconda3:latest
MAINTAINER Angelos Tzotsos <gcpp.kalxas@gmail.com>

# update conda and install arcsi using conda package manager and clean up (rm tar packages to save space) 
RUN conda update --yes conda && \
conda install --yes -c conda-forge -c au-eoed python=3.5 arcsi && \
conda clean --yes -t

# set gdal paths
ENV GDAL_DRIVER_PATH /opt/conda/lib/gdalplugins:$GDAL_DRIVER_PATH
ENV GDAL_DATA /opt/conda/share/gdal

# add debian packages required by arcsi
RUN apt-get update && apt-get install -y libgfortran3 libglib2.0-0 libsm6 libxrender1 libfontconfig1 libxext6

