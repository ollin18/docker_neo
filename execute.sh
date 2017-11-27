docker build --tag empty_neo:0.1 --tag empty_neo:latest .

docker run \
    --publish=7475:7475 --publish=7476:7476 \
    --volume=$HOME/data:/data \
    --volume=$HOME/neo4j/logs:/logs \
    --env=NEO4J_AUTH=none \
empty_neo
