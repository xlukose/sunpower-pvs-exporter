FROM python:2.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
CMD ["sunpower-pvs-exporter"]
