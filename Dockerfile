FROM alpine:3.8

RUN apk update && \
    apk add --no-cache R \
        build-base \
        R-dev \
        libgit2-dev \
        libressl-dev \
        curl-dev && \
    R -e 'install.packages(c("dplyr", "tidyr"), repos = c("https://cran.rstudio.com"))' && \
    apk del build-base R-dev libgit2-dev libressl-dev curl-dev


