FROM apache/airflow:3.1.5-python3.12

ENV SHELL=/bin/bash

USER root

# Install system dependencies in a single layer and clean up
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        openjdk-17-jdk-headless \
        openjdk-17-jre-headless \
        gnupg \
        git \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow

# Copy requirements first for better layer caching
ADD requirements.txt .

# Install Python dependencies in a single layer
RUN pip install --upgrade pip --no-cache-dir \
    && pip install --no-cache-dir -r requirements.txt

# Copy plugins last as they may change more frequently
COPY plugins /opt/airflow/plugins
