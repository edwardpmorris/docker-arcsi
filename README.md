# docker-arcsi
A Docker image packaging Dr Pete Buntings Python Atmospheric and Radiometric Correction of Satellite Imagery (ARCSI) software (https://bitbucket.org/petebunting/arcsi).

This image is based on the official continuumio miniconda python 3.4 release, minimal optimisation and installation of arcsi + dependencies using the conda package manager. Paths and Debian libraries required for proper functioning of ARCSI are updated.

**Warning - The resulting image is rather large**

## Setup
To set up a ARCSI Docker container on your system, first ensure you have Docker installed; follow the instructions at https://docs.docker.com/installation/

To use the image, either pull the latest trusted build from https://registry.hub.docker.com/u/epmorris/docker-arcsi/ by doing this:

`docker pull epmorris/docker-arcsi`

or build the image yourself like this:

`docker build -t epmorris/docker-arcsi https://github.com/edwardpmorris/docker-arcsi`

Note: The 'build it yourself' option above will build from the develop branch wheras the trusted builds are against the master branch.

To run a container and get help on ARCSI commandline options do:

`docker run -t epmorris/docker-arcsi arcsi.py -h`

Probably you will want to mount a local volume with images, such as freely available USGS Landsat 8 images (available via http://earthexplorer.usgs.gov/) and apply atmospheric correction, for example 'top-of-atmosphere' correction.

```
docker run -i \

-v <path_to_local_landsat_folder>:<path_to_local_landsat_folder> \

-t epmorris/docker-arcsi arcsi.py -s ls8 -f GTiff -p TOA -i <path_to_local_landsat_folder><landsat_metadata_file>
```

Replace <path_to_local_landsat_folder> with an absolute path on your filesystem and <landsat_metadata_file> with the landsat metadata file (i.e., LC82020352014224LGN00_MTL.txt). The folder should contain the uncompressed landsat GeoTiff image files and metadata file.

See http://spectraldifferences.wordpress.com/tag/arcsi/ by Dan Clewley and Pete Bunting for a good tutorial on how to use ARCSI via the command line to do atmospheric correction of Landsat images.

See Docker user guide, particularily how to add data volumes https://docs.docker.com/userguide/dockervolumes/