#!/bin/bash
for a in *.dot; do
    echo "traitement du fichier $a"
    a2="${a%.*}"
    dot -Tsvg "$a" > "$a2.svg"
done
