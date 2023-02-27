
FROM apache/airflow
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends\
         wget \
  && apt-get install -y --no-install-recommends \
         nano \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow

COPY . .
#RUN python -m pip install --upgrade pip
#RUN pip install --no-cache-dir -r requirements.txt
#RUN python installscripts.py &
#RUN jupyter lab --port=8888 &
#EXPOSE 8888

