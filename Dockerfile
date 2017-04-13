FROM rocker/verse:latest

MAINTAINER "Nick Forrester" nickforr@me.com

RUN apt-get update \ 
  && apt-get install -y --no-install-recommends \
  lbzip2 \
  libv8-dev \
  libproj-dev \
  libudunits2-dev \
  #libgdal-dev \
  #libgeos-dev \
  && wget http://download.osgeo.org/gdal/2.1.3/gdal-2.1.3.tar.gz \
  && tar -xf gdal-2.1.3.tar.gz \
  && wget http://download.osgeo.org/geos/geos-3.5.1.tar.bz2 \
  && tar -xf geos-3.5.1.tar.bz2 \
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
  
