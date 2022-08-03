FROM alpine

# update package list
RUN apk update

# install necessary packages to install stress
RUN apk add git autoconf automake build-base

# Install stress
RUN git clone https://github.com/resurrecting-open-source-projects/stress.git && \
	cd stress && \
	./autogen.sh && \
	./configure && \
	make && \
	make install

RUN mkdir scripts
COPY stress_test.sh scripts/stress_test.sh
WORKDIR scripts

RUN ls

RUN chmod +x stress_test.sh
CMD ["bash", "stress_test.sh"]

