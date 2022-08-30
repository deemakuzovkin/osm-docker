FROM postgis/postgis
ARG OSM_FILE=kaliningrad-latest.osm.pbf
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_HOST="172.17.0.2"
ENV POSTGRES_PORT="5432"
ENV POSTGRES_DB=osm
ENV PGPASSWORD=postgres
ENV IMPORT_FILE_NAME=$OSM_FILE
ADD custom_files/$OSM_FILE /tmp/$OSM_FILE
RUN apt-get update && apt-get install osm2pgsql -y
RUN apt-get clean
RUN rm -rf /var/cache/apt/lists
CMD osm2pgsql --slim --host=$POSTGRES_HOST --port=$POSTGRES_PORT --user=$POSTGRES_USER --database=$POSTGRES_DB tmp/$IMPORT_FILE_NAME
