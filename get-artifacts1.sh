#!/bin/bash
tok=$(cat ~/token.gh)

# Récupération des informations sur les artefacts au format JSON
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/Andyyyy12345/tp-graphes/actions/artifacts \
  > gh-artifacts.json

cat gh-artifacts.json
