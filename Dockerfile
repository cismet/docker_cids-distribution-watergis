FROM reg.cismet.de/abstract/cids-distribution:6.3-debian

ARG IMAGE_VERSION=unknown

ENV TZ=Europe/Berlin
# the following 3 lines are required the prevent server encoding problems
ENV LANG de_DE.UTF-8  
ENV LANGUAGE de_DE:de  
ENV LC_ALL de_DE.UTF-8
ENV GIT_DISTRIBUTION_PROJECT=cismet/cids-distribution-watergis
ENV CIDS_CODEBASE https://watergis-leela.cismet.de
ENV CIDS_ACCOUNT_EXTENSION Watergis
ENV UPDATE_SNAPSHOTS -U -Dmaven.clean.failOnError=false -Dmaven.test.skip=true

# needed for the report generation stuff to work in a headless environment
RUN apt-get update && \
   apt-get install -y xvfb libxrender1 libxtst6 && \
   apt-get clean

LABEL maintainer="Jean-Michel Ruiz <jean.ruiz@cismet.de>" \
   de.cismet.cids.distribution.name="${GIT_DISTRIBUTION_PROJECT}" \
   de.cismet.cids.distribution.description="cids watergis Distribution Runtime Image" \
   de.cismet.cids.distribution.version="${IMAGE_VERSION}" \

