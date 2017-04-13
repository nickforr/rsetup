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
  libgdal-dev \
  libgeos-dev \
  && MRAN=https://mran.microsoft.com/snapshot/31-03-2017 \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
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
  
