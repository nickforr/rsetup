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
    abind \
    assertive \
    assertthat \
    AzureML \
    BayesFactor \
    beeswarm \
    bookdown \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    checkpoint \
    chron \
    circlize \
    corrplot \
    covr \
    d3heatmap \
    daff \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    data.table \
    DBI \
    dendextend \
    devtools \
    dfoptim \
    DiagrammeR \
    doBy \
    doParallel \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    dplyr \
    drat \
    DT \
    dygraphs \
    edgebundleR \
    extrafont \
    feather \
    flexdashboard \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    forcats \
    foreach \
    formatR \
    fortunes \
    future \
    GGally \
    ggalt \
    ggiraph \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    ggmap \
    ggplot2 \
    ggplot2movies \
    ggrepel \
    ggthemes \
    ggvis \
    git2r \
    googleAuthR \
    googleVis \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    gridBase \
    gridExtra \
    gtable \
    gtools \
    highr \
    Hmisc \
    hrbrthemes \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    htmlTable \
    htmltools \
    htmlwidgets \
    httpuv \
    httr \
    installr \
    jsonlite \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    knitr \
    latticeExtra \
    lazyeval \
    leaflet \
    likert \
    lubridate \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    maps \
    maptools \
    markdown \
    mclust \
    metricsgraphics \
    microbenchmark \
    miniCRAN \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    mvtnorm \
    NLP \
    openssl \
    optimx \
    packrat \
    pairsD3 \
    plotly \
    profvis \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    psych \
    purrr \
    Quandl \
    rbokeh \
    readxl \
    remotes \
    reshape2 \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    revealjs \
    rfoaas \
    rgeos \
    RGoogleAnalytics \
    RgoogleMaps \
    rhandsontable \
    rmarkdown \
    rngtools \
    RODBC \
    rootSolve \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    roxygen2 \
    rsconnect \
    Rserve \
    RSQLite \
    rstudioapi \
    scales \
    scatterD3 \
    shiny \
    shinydashboard \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    shinyjs \
    shinythemes \
    sn \
    SnowballC \
    sparklyr \
    SparseM \
    testthat \
    threejs \
    tidyr \
    tidyverse \
  && . /etc/environment \
  && install2.r --error --repos $CRAN --deps TRUE \
    tm \
    treemap \
    tufte \
    validate \
    vegalite \
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
