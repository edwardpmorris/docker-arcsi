# docker-arcsi
A Docker image packaging Dr Pete Buntings Python Atmospheric and Radiometric Correction of Satellite Imagery (ARCSI) software (https://bitbucket.org/petebunting/arcsi).

This image is based on the official continuumio miniconda python 3.4 release, minimal optimisation and installation of arcsi + dependencies using the conda package manager. Paths and Debian libraries required for proper functioning of ARCSI are updated.

**Warning - The resulting image is rather large**

### Setup
To set up a ARCSI Docker container on your system, first ensure you have Docker installed; follow the instructions at https://docs.docker.com/installation/

To use the image, either pull the latest trusted build from https://registry.hub.docker.com/u/epmorris/docker-arcsi/ by doing this:

`docker pull epmorris/docker-arcsi`

or build the image yourself like this:

`docker build -t epmorris/docker-arcsi https://github.com/edwardpmorris/docker-arcsi`

Note: The 'build it yourself' option above will build from the develop branch wheras the trusted builds are against the master branch.

### Usage
To run a container and get help on ARCSI commandline options do:

`docker run -t epmorris/docker-arcsi arcsi.py -h`

To mount a local volume with images, such as freely available USGS Landsat 8 images (available via http://earthexplorer.usgs.gov/), apply radiometric calibration and apply atmospheric correction, for example 'top-of-atmosphere' correction, do:

```
docker run -i -t \

-v <path_to_local_landsat_folder>:<path_to_local_landsat_folder> \

epmorris/docker-arcsi \

arcsi.py \
-s ls8 \
-f GTiff \
-p RAD TOA \
-i <path_to_local_landsat_folder><landsat_metadata_file>
-o <path_to_local_landsat_folder>
```

Flag `-v` tells Docker to mount the specified local volume (in the example this is simply cloned into the container). Replace `<path_to_local_landsat_folder>` with an **absolute** path on your filesystem. See Docker user guide, particularily how to add data volumes https://docs.docker.com/userguide/dockervolumes/ . The folder should contain the uncompressed landsat GeoTiff image files and metadata file. At present I did not work out how to include non-local media, such as USBsticks.

Including a command after the container tells Docker to run that command via Bash, here `arcsi.py`, which requires various options/flags to be defined (see `arcsi.py -h`). In the example `-s` defines the sensor, `-f` the output file format, `-p` the type of processing, `-i` the path to a metadata file, `-o` product output path (in this case the original folder). To try out the command remember to change `<landsat_metadata_file>` to the relative path of the landsat metadata file (i.e., `LC82020352014224LGN00_MTL.txt`). 

See http://spectraldifferences.wordpress.com/tag/arcsi/ by Dan Clewley and Pete Bunting for a good tutorial on how to use ARCSI via the command line to do atmospheric correction of Landsat images. Support for ARCSI is available via https://bitbucket.org/petebunting/arcsi and rsgislib-support@googlegroups.com. Finally, thanks to the arcsi and rsgislib authors for making their great code publically available. 

