#!/bin/bash
for a in *.dot; do
    echo "traitement du fichier $a"
    a2="${a%.*}"
    # Génération directe en PNG (incruste les images et préserve la taille)
    dot -Tpng "$a" > "$a2.png"
done
