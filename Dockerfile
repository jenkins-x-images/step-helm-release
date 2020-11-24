# this is the build image so don't worry about using stuff...
FROM centos:7
RUN yum install -y git make
# helm 3
ENV HELM3_VERSION 3.4.0
RUN curl -f -L https://get.helm.sh/helm-v${HELM3_VERSION}-linux-386.tar.gz | tar xzv && \
    mv linux-386/helm /usr/local/bin/

# this is the directory used in pipelines for home dir
ENV HOME /tekton/home
# these env vars are used to install helm plugins
ENV XDG_CACHE_HOME /home/.cache
ENV XDG_CONFIG_HOME /home/.config
ENV XDG_DATA_HOME /home/.data
ENV PATH /usr/local/bin:$PATH

RUN helm plugin install https://github.com/hayorov/helm-gcs