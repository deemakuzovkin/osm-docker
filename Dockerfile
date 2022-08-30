FROM postgis/postgis
ARG OSM_FILE=kaliningrad-latest.osm.pbf
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=osm
ADD custom_files/$OSM_FILE /tmp/$OSM_FILE
RUN apt-get update && apt-get install osm2pgsql -y
RUN apt-get clean
RUN rm -rf /var/cache/apt/lists
