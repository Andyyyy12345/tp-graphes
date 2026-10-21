#!/bin/bash
tok=$(cat ~/token.gh)

echo "1. Téléchargement de la liste d'artefacts..."
curl -s \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/Andyyyy12345/tp-graphes/actions/artifacts" > gh-artifacts.json

id=$(jq '.artifacts[0].id' gh-artifacts.json)

if [ "$id" == "null" ] || [ -z "$id" ]; then
    echo "Erreur : Aucun artefact disponible."
    exit 1
fi

echo "2. Téléchargement du dernier artefact (ID: $id)..."
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -o "artifact_${id}.zip" \
  "https://api.github.com/repos/Andyyyy12345/tp-graphes/actions/artifacts/${id}/zip"

echo "3. Décompression dans extracted_${id}..."
unzip -o "artifact_${id}.zip" -d "extracted_${id}"

echo "Terminé !"
