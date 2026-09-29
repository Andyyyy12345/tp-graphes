if [ -z "$1" ]; then
    echo "Erreur : argument manquant. Utilisation : $0 <nom_du_fichier>" >&2
    exit 1
fi
tool=neato
$tool -Tpng $1.dot >$1.png
$tool -Tsvg $1.dot >$1.svg
