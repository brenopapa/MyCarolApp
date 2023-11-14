FROM gcr.io/labs-ai-apps-production/caroldatavalidation/datavalidation:0.0.1

USER root

WORKDIR /usr/dbt
ENV dbt_PROFILES_DIR=/usr/dbt

COPY . /usr/imports

RUN mv -rf /usr/imports/* /usr/dbt

VOLUME [ "/usr/dbt" ]

CMD ["/entrypoint.sh"]