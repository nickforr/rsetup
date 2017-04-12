FROM rocker/verse:latest

MAINTAINER "Nick Forrester" nick.forrester@hymans.co.uk

RUN apt-get update \ 
  && apt-get install -y --no-install-recommends \
  libv8-dev \
  libproj-dev \
  && MRAN=https://mran.microsoft.com/snapshot/2017-03-10 \
  && HYMANSDRAT=http://hymansdrat.azurewebsites.net \
  && echo "options(repos = c(MRAN = '$MRAN', hymansDrat = '$HYMANSDRAT'))" \
  > /usr/local/lib/R/etc/Rprofile.site \
  && Rscript -e "update.packages(repos = getOption('repos'), ask = FALSE)" \
  && Rscript -e "install.packages('hymansCommonPkgs', repos = getOption('repos'))" \
  && Rscript -e "install.packages('hymansR', repos = getOption('repos'))" \
  ## Want to install hymans common packages here
  && Rscript -e "hymansCommonPkgs::installUsefulPkgsAll(repos = getOption('repos'))"
  
