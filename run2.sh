#!/bin/bash
for a in *.dot; do
    echo "traitement du fichier $a"
    a2="${a%.*}"
    # Utilisation de dot pour tous les fichiers .dot
    dot -Tsvg "$a" > "$a2.svg"
done
