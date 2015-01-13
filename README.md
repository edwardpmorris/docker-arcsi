# docker-arcsi
A Docker image packaging Dr Pete Buntings Python Atmospheric and Radiometric Correction of Satellite Imagery (ARCSI) software (https://bitbucket.org/petebunting/arcsi).

This image is based on the official continuumio miniconda python 3.4 release, minimal optimisation and installation of arcsi + dependencies using the conda package manager. Paths and debian libraries required for proper functioning of ARCSI are updated.

**Warning - The resulting image is rather large**

## Setup
To set up a virtual ARCSI installation using Docker on your system:

1. Install Docker (Ideally > v1.0); follow the instructions at https://docs.docker.com/installation/
CHANGE TO AUTO PULL!
1. Download or pull the Dockerimage file
1. Navigate to folder with Dockerimage, e.g.,  `cd ~/docker-arcsi
1. run sudo docker build -t="epmorris/trusty_miniconda_arcsi:v0.1" .
1. to clean up you can use 
``` docker ps
docker stop ...
docker rm <containerid>
docker rmi <imageid>
```
