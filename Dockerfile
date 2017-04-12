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
  && Rscript -e "install.packages(
    'assertthat',
    'beeswarm',
    'checkpoint',
    'covr',
    'data.table',
    'DT',
    'extrafont',
    'flexdashboard',
    'ggalt',
    'ggiraph',
    'ggmap',
    'ggrepel',
    'ggthemes',
    'ggvis',
    'git2r',
    'gridBase',
    'gridExtra',
    'highr',
    'Hmisc',
    'htmlTable',
    'htmltools',
    'htmlwidgets',
    'httr',
    'jsonlite',
    'leaflet',
    'lubridate',
    'microbenchmark',
    'mvtnorm',
    'optimx',
    'plotly',
    'profvis',
    'psych',
    'Quandl',
    'rbokeh',
    'revealjs',
    'rfoaas',
    'rhandsontable',
    'shiny',
    'shinydashboard',
    'shinyjs',
    'shinythemes',
    'sn',
    'SnowballC',
    'sparklyr',
    'SparseM',
    'testthat',
    'tm',
    'viridis',
    'viridisLite',
    'waffle',
    'wordcloud',
    'XML',
    'xml2',
    'xtable',
    'xts',
    'yaml',
    'yarrr',
    'zoo',
    repos = getOption('repos'), ask = FALSE)" \
  && Rscript -e "devtools::install_github( \
    c('hrbrmstr/pluralize', \
    'hrbrmstr/streamgraph', \
    'hrbrmstr/hrbrthemes', \
    'jcheng5/bubbles', \
    'mattflor/chorddiag', \
    'timelyportfolio/rcdimple'))"
  
