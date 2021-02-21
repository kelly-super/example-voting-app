set -ex

# docker-compose -f docker-compose.cypress.yml up --exit-code-from cypress
# docker-compose -f docker-compose.cypress.yml down

cd voting_app_cypress

docker run -it -v $PWD:/e2e -w /e2e cypress/included:5.0.0
 
cd -