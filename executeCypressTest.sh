set -ex
node --version
npm run cypress run --spec "cypress/integration/examples/actions.spec.js"