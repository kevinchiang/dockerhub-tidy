FROM debian:9.5-slim

RUN apt-get update && \
    apt-get install -y \
        gnupg2 \ 
        dirmngr && \
    apt-key adv --keyserver ipv4.pool.sks-keyservers.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF' && \
    echo "deb http://cran.cnr.berkeley.edu/bin/linux/debian/ stretch-cran35/" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y \
        r-base \
        r-base-dev \
        libcurl4-openssl-dev && \
    R -e 'install.packages(c("dplyr", "tidyr"), repos = c("https://cran.rstudio.com"))' && \
    apt-get remove -y r-base-dev libcurl4-openssl-dev gnupg2 dirmngr && \
    apt -y autoremove && \
    apt-get clean && \
    rm -rf \ 
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*
