FROM debian
RUN apt-get update
RUN apt-get install -y python-pip curl
RUN apt-get install -y git # could remove after https://github.com/AnalogJ/lexicon/pull/34 merged.
RUN apt-get install -y python-dev libffi-dev libssl-dev
RUN pip install -U pip
RUN pip install requests[security] --upgrade
RUN pip install git+https://github.com/mycard/lexicon.git
COPY . /usr/src/app
WORKDIR /usr/src/app
ADD https://raw.githubusercontent.com/AnalogJ/lexicon/master/examples/letsencrypt.default.sh letsencrypt.default.sh
RUN chmod +x letsencrypt.default.sh
ENTRYPOINT [ "./letsencrypt.sh" ]
