set -ex
node --version

cd learnCypress2
npm install
npx cypress run --spec "cypress/integration/examples/actions.spec.js"
cd -