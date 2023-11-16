FROM gcr.io/labs-ai-apps-production/caroldatavalidation/datavalidation:0.0.1

USER root

WORKDIR /usr/dbt
ENV dbt_PROFILES_DIR=/usr/dbt

COPY . /usr/imports

RUN mv /usr/imports/* /usr/dbt

VOLUME [ "/usr/dbt" ]

CMD ["/usr/dbt/entrypoint.sh"]
