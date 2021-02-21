set -ex

docker-compose -f docker-compose.cypress.yml up --exit-code-from cypress
docker-compose -f docker-compose.cypress.yml down
