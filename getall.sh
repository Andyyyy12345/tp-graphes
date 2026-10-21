#!/bin/bash
tok=$(cat ~/token.gh)

echo "1. Téléchargement de la liste d'artefacts la plus récente..."
curl -s \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/Andyyyy12345/tp-graphes/actions/artifacts" > gh-artifacts.json

# Extrait uniquement l'ID du tout premier artefact (le plus récent à l'index 0)
id=$(jq '.artifacts[0].id' gh-artifacts.json)

if [ "$id" == "null" ] || [ -z "$id" ]; then
    echo "Erreur : Aucun artefact disponible sur le dépôt."
    exit 1
fi

echo "2. Téléchargement de l'artefact le plus récent (ID: $id)..."
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $tok" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -o "artifact_${id}.zip" \
  "https://api.github.com/repos/Andyyyy12345/tp-graphes/actions/artifacts/${id}/zip"

echo "3. Décompression dans extracted_${id}..."
unzip -o "artifact_${id}.zip" -d "extracted_${id}"

echo "Terminé avec succès !"
