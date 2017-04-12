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
  && Rscript -e "devtools::install_github( \
  c('hrbrmstr/pluralize', \
  'hrbrmstr/streamgraph', \
  'hrbrmstr/hrbrthemes', \
  'jcheng5/bubbles', \
  'mattflor/chorddiag', \
  'timelyportfolio/rcdimple'))" \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    assertthat \
    beeswarm \
    checkpoint \
    covr \
    data.table \
    DT \
    extrafont \
    flexdashboard \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    ggalt \
    ggiraph \
    ggmap \
    ggrepel \
    ggthemes \
    ggvis \
    git2r \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    gridBase \
    gridExtra \
    highr \
    Hmisc \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    htmlTable \
    htmltools \
    htmlwidgets \
    httr \
    jsonlite \
    leaflet \
    lubridate \
    microbenchmark \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    mvtnorm \
    optimx \
    plotly \
    profvis \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    psych \
    Quandl \
    rbokeh \
    revealjs \
    rfoaas \
    rhandsontable \
    shiny \
    shinydashboard \
    shinyjs \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \    
    shinythemes \
    sn \
    SnowballC \
    sparklyr \
    SparseM \
    testthat \
    tm \
    viridis \
    viridisLite \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    waffle \
    wordcloud \
    XML \
    xml2 \
    xtable \
    xts \
    yaml \
    yarrr \
    zoo
