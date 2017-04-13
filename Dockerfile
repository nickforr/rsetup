FROM rocker/verse:latest

MAINTAINER "Nick Forrester" nickforr@me.com

RUN apt-get update \ 
  && apt-get install -y --no-install-recommends \
  lbzip2 \
  libv8-dev \
  libproj-dev \
  libudunits2-dev \
  libdap-dev \
  libexpat1-dev \
  libfftw3-dev \
  libfreexl-dev \
  libgsl0-dev \
  libglu1-mesa-dev \
  libhdf4-alt-dev \
  libhdf5-dev \
  liblwgeom-dev \
  libkml-dev \
  libnetcdf-dev \
  libproj-dev \
  libsqlite3-dev \
  libssl-dev \
  libtcl8.5 \
  libtk8.5 \
  libtiff5-dev \
  libxerces-c-dev \
  netcdf-bin \
  unixodbc-dev \
  #libgdal-dev \
  #libgeos-dev \
  && wget http://download.osgeo.org/gdal/2.1.3/gdal-2.1.3.tar.gz \
  && tar -xf gdal-2.1.3.tar.gz \
  && wget http://download.osgeo.org/geos/geos-3.5.1.tar.bz2 \
  && tar -xf geos-3.5.1.tar.bz2 \
  ## Install dependencies of gdal-$GDAL_VERSION
## && echo "deb-src http://deb.debian.org/debian jessie main" >> /etc/apt/sources.list \
## Install libgeos \
  && cd /geos* \
  && ./configure \
  && make \
  && make install \
## Configure options loosely based on homebrew gdal2 https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/gdal2.rb
  && cd /gdal* \
  && ./configure \
    --with-curl \
    --with-dods-root=/usr \
    --with-freexl \
    --with-geos \
    --with-geotiff \
    --with-hdf4 \
    --with-hdf5=/usr/lib/x86_64-linux-gnu/hdf5/serial \
    --with-libjson-c \
    --with-netcdf \
    --with-odbc \
    ##
    --without-grass \
    --without-libgrass \
  && make \
  && make install \
  && cd .. \
  ## Cleanup gdal & geos installation
  && rm -rf gdal-* geos-* \
  && . /etc/environment \
  && install2.r --error \
    --repos $MRAN \ 
    --deps TRUE \
    Hmisc lubridate ggiraph ggrepel ggthemes leaflet optimx \
    microbenchmark shiny shinydashboard htmlTable optimx xtable \
  && Rscript -e "devtools::install_github( \
    c('hrbrmstr/pluralize', \
    'hrbrmstr/streamgraph', \
    'hrbrmstr/hrbrthemes', \
    'jcheng5/bubbles', \
    'mattflor/chorddiag', \
    'timelyportfolio/rcdimple'))"
  
