FROM rocker/verse:latest

MAINTAINER "Nick Forrester" nickforr@me.com

ENV GDAL_VERSION 2.1.3
ENV GEOS_VERSION 3.5.1

RUN apt-get update \ 
  && apt-get install -y --no-install-recommends \
  lbzip2 \
  libv8-dev \
  libproj-dev \
  libudunits2-dev \
  libgdal-dev \
  libgeos-dev \
  && wget http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz \
  && tar -xf gdal-${GDAL_VERSION}.tar.gz \
  && wget http://download.osgeo.org/geos/geos-${GEOS_VERSION}.tar.bz2 \
  && tar -xf geos-${GEOS_VERSION}.tar.bz2 \
  && . /etc/environment \
  && install2.r --error \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
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
  
