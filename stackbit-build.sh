#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db1023bfacbc6001be79a44/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db1023bfacbc6001be79a44
curl -s -X POST https://api.stackbit.com/project/5db1023bfacbc6001be79a44/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db1023bfacbc6001be79a44/webhook/build/publish > /dev/null
