#!/bin/sh

TEMP=$(basename "${TRAVIS_REPO_SLUG}")
mkdir -p ../Images  > /dev/null 2>&1
mkdir -p ../Gerbers  > /dev/null 2>&1

python3 plot_gerbers.py "../$TEMP.kicad_pcb"
python3 plot_board.py "../$TEMP.kicad_pcb"

mv "../plot/$TEMP-Front.png" "../Images/Front.png"
mv "../plot/$TEMP-Back.png" "../Images/Back.png"
mv ../plot/$TEMP\_gerbers.zip ../Gerbers/ > /dev/null 2>&1

rm ../plot/*
rm -d ../plot

./travis_push.sh
