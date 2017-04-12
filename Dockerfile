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
  && . /etc/environment \
  && install2.r --error --repos $MRAN --deps TRUE \
    abind \
    assertive \
    assertthat \
    AzureML \
    BayesFactor \
    beeswarm \
    bookdown \
    checkpoint \
    chron \
    circlize \
    corrplot \
    covr \
    d3heatmap \
    daff \
    data.table \
    DBI \
    dendextend \
    devtools \
    dfoptim \
    DiagrammeR \
    doBy \
    doParallel \
    dplyr \
    drat \
    DT \
    dygraphs \
    edgebundleR \
    extrafont \
    feather \
    flexdashboard \
    forcats \
    foreach \
    formatR \
    fortunes \
    future \
    GGally \
    ggalt \
    ggiraph \
    ggmap \
    ggplot2 \
    ggplot2movies \
    ggrepel \
    ggthemes \
    ggvis \
    git2r \
    googleAuthR \
    googleVis \
    gridBase \
    gridExtra \
    gtable \
    gtools \
    highr \
    Hmisc \
    hrbrthemes \
    htmlTable \
    htmltools \
    htmlwidgets \
    httpuv \
    httr \
    installr \
    jsonlite \
    knitr \
    latticeExtra \
    lazyeval \
    leaflet \
    likert \
    lubridate \
    maps \
    maptools \
    markdown \
    mclust \
    metricsgraphics \
    microbenchmark \
    miniCRAN \
    mvtnorm \
    NLP \
    openssl \
    optimx \
    packrat \
    pairsD3 \
    plotly \
    profvis \
    psych \
    purrr \
    Quandl \
    rbokeh \
    readxl \
    remotes \
    reshape2 \
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
    roxygen2 \
    rsconnect \
    Rserve \
    RSQLite \
    rstudioapi \
    scales \
    scatterD3 \
    shiny \
    shinydashboard \
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
    tm \
    treemap \
    tufte \
    validate \
    vegalite \
    viridis \
    viridisLite \
    waffle \
    wordcloud \
    XML \
    xml2 \
    xtable \
    xts \
    yaml \
    yarrr \
    zoo
