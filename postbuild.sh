#!/usr/bin/env bash

# Creates an additional version of the manifest for Firefox
mkdir build/chrome
mv build/* build/chrome
cp -r build/chrome build/firefox
sed -ri.bak 's/service_worker": "(.*)"/scripts": ["\1"]/' build/firefox/manifest.json
rm build/firefox/manifest.json.bak

(
  cd build/firefox || :
  zip -rXq ../NetworkChunks.xpi ./*
)

echo 'Created Firefox build'
