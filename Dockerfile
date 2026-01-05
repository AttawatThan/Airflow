FROM apache/airflow:3.1.5-python3.12

ENV SHELL=/bin/bash

USER root

RUN apt-get update && apt-get install -y openjdk-17-jdk-headless \
    && apt-get install -y openjdk-17-jre-headless \
    && apt-get install -y gnupg \
    && apt-get autoremove -yqq --purge \
    && apt-get clean

USER airflow

ADD requirements.txt .
COPY plugins /opt/airflow/plugins

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
