FROM python:3.7-alpine
MAINTAINER Roshan App Developer Ltd

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-bulid-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip3 install -r /requirements.txt
RUN apk del .tmp-bulid-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
