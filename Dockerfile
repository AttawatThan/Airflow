FROM apache/airflow:2.10.2-python3.11

USER root

# # For POC dbt
# RUN apt-get update && apt-get install -y libpq-dev \
#     && apt-get install -y python3-dev \
#     && apt-get install -y gcc

RUN apt-get update && apt-get install -y openjdk-17-jdk-headless \
    && apt-get install -y openjdk-17-jre-headless \
    && apt-get install -y gnupg \
    && apt-get autoremove -yqq --purge \
    && apt-get install -y iputils-ping \
    && apt-get clean

USER airflow

ADD requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
