FROM python:3.10-alpine
MAINTAINER Volodymir Zybin

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY requirements.txt /temp/requirements.txt
COPY app /app
WORKDIR /app
EXPOSE 8000

RUN pip install --upgrade pip
RUN apk add postgresql-client build-base postgresql-dev
RUN pip install -r /temp/requirements.txt
RUN adduser --disabled-password user-app

USER user-app
