set -ex

if [ ! -d "./learnCypress2" ]; then
  echo "cloning cypress code..."
  git clone --depth=1 https://github.com/nzleoliang/learnCypress2.git
else
  echo "nobob directory exists, just pulling the latest code"
  cd learnCypress2 && git clean -fdx && git pull && cd -
fi