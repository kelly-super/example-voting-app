set -ex
node --version

cd learnCypress2
npm install
# workaround for this issue https://github.com/cypress-io/cypress/issues/4624
npx cypress cache clear
npm install --save-dev cypress
# end of workaround
node_modules/.bin/cypress run --spec "cypress/integration/examples/actions.spec.js"
cd -