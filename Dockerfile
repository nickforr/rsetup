FROM rocker/verse:latest

MAINTAINER "Nick Forrester" nickforr@me.com

RUN apt-get update \ 
  && apt-get install -y --no-install-recommends \
  libv8-dev \
  libproj-dev \
  && CRAN=https://cran.rstudio.com \
  && echo "options(repos = c(CRAN = '$CRAN', MRAN = '$MRAN'))" \
  > /usr/local/lib/R/etc/Rprofile.site \
  && Rscript -e "update.packages(repos = getOption('repos'), ask = FALSE)" \
  && Rscript -e "install.packages( \
    'flexdashboard', \
    'ggalt', \
    'ggiraph', \
    'ggrepel', \
    'ggthemes', \
    'Hmisc', \
    'htmlTable', \
    'htmlwidgets', \
    'httr', \
    'jsonlite', \
    'leaflet', \
    'lubridate', \
    'microbenchmark', \
    'optimx', \
    'shiny', \
    'shinydashboard', \
    'testthat', \
    'xtable', \
    'xts', \
    'zoo', \
    repos = getOption('repos'), ask = FALSE)" \
  && Rscript -e "devtools::install_github( \
    c('hrbrmstr/pluralize', \
    'hrbrmstr/streamgraph', \
    'hrbrmstr/hrbrthemes', \
    'jcheng5/bubbles', \
    'mattflor/chorddiag', \
    'timelyportfolio/rcdimple'))"
  
