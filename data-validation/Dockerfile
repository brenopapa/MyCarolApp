FROM gcr.io/labs-ai-apps-production/caroldatavalidation/datavalidation:0.0.1

USER root

WORKDIR /usr/dbt
ENV dbt_PROFILES_DIR=/usr/dbt

COPY . /usr/imports

RUN mv /usr/imports/* /usr/dbt

VOLUME [ "/usr/dbt" ]

CMD ["/entrypoint.sh"]


# FROM ghcr.io/dbt-labs/dbt-bigquery:1.7.2

# USER root

# RUN mkdir -p /usr/dbt &&\
#     mkdir -p /usr/dbt/logs &&\
#     mkdir -p /usr/imports &&\
#     touch /usr/dbt/logs/dbt.log

# ENV TZ=America/Sao_Paulo
# ENV dbt_PROFILES_DIR=/usr/dbt

# WORKDIR /usr/dbt

# COPY ./src /usr/dbt
# COPY ./requirements.txt /usr/dbt

# RUN pip install -r requirements.txt

# RUN dbt deps
