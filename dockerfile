FROM alpine

# update package list
RUN apk update

# install stress
RUN apk add stress

RUN mkdir scripts
COPY stress_test.sh scripts/stress_test.sh
WORKDIR scripts



