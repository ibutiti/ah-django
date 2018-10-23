FROM ubuntu:16.04

MAINTAINER ibutiti

RUN apt-get update -y && \
    apt-get install -y software-properties-common -y

RUN add-apt-repository ppa:jonathonf/python-3.7 && \
    apt-get update -y && \
    apt-get install -y python3-pip python3-dev

RUN pip3 install pipenv

COPY . /ah

WORKDIR /ah

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

RUN pipenv install --system --deploy

EXPOSE 8000

ENTRYPOINT ["python3", "manage.py", "runserver"]