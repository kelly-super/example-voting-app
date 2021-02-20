set -ex
node --version
npx cypress run --spec "cypress/integration/examples/actions.spec.js"