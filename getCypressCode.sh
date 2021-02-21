set -ex

if [ ! -d "./learnCypress2" ]; then
  echo "cloning cypress code..."
  git clone --depth=1 https://github.com/nzleoliang/voting_app_cypress.git
else
  echo "nobob directory exists, just pulling the latest code"
  cd voting_app_cypress && git pull && cd -
fi