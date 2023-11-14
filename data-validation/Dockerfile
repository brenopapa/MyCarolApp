FROM gcr.io/labs-ai-apps-production/caroldatavalidation/datavalidation:0.0.1

USER root

WORKDIR /usr/dbt
ENV dbt_PROFILES_DIR=/usr/dbt

RUN echo "HERE IT IS ---------- $dbt_PROFILES_DIR"

COPY . /usr/dbt/

CMD ["python", "/usr/dbt/scripts/serviceaccount.py"]

RUN   dbt deps >> deps.txt
RUN   dbt test >> test.txt

CMD ["python", "/app/src/storereport.py"]