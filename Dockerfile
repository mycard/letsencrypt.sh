FROM debian
RUN apt-get update
RUN apt-get install -y python-pip curl
RUN apt-get install -y git # could remove after https://github.com/AnalogJ/lexicon/pull/34 merged.
RUN pip install git+https://github.com/mycard/lexicon.git
COPY . /usr/src/app
WORKDIR /usr/src/app
ENTRYPOINT ./letsencrypt.sh
