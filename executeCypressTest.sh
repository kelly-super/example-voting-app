set -x
node --version

# cd learnCypress2
# npm install
# workaround for this issue https://github.com/cypress-io/cypress/issues/4624
# npx cypress cache clear
# npm install --save-dev cypress
# end of workaround
# node_modules/.bin/cypress run --spec "cypress/integration/examples/actions.spec.js"

docker-compose -f docker-compose.cypress.yml up --exit-code-from cypress
docker-compose -f docker-compose.cypress.yml down
# cd -