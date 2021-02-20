set -ex
node --version
npm install
npx cypress run --spec "cypress/integration/examples/actions.spec.js"