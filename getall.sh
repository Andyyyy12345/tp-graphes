#!/bin/bash
tok=$(cat ~/token.gh)

# Génère la liste des IDs à jour
jq '.artifacts[].id' gh-artifacts.json > liste-id.txt

# Boucle sur chaque ID pour télécharger et dézipper l'artefact
while read -r id; do
    echo "Téléchargement de l'artefact ID: $id..."
    curl -L \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: token $tok" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      -o "artifact_${id}.zip" \
      "https://api.github.com/repos/Andyyyy12345/tp-graphes/actions/artifacts/${id}/zip"

    echo "Décompression de artifact_${id}.zip..."
    unzip -o "artifact_${id}.zip" -d "extracted_${id}"
done < liste-id.txt
