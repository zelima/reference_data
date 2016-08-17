#!/bin/sh

URL="https://raw.githubusercontent.com/datasets/country-codes/master/data/country-codes.csv"
curl -s $URL  > countries.csv
./extract.py < countries.csv  | tail -n +4 | sort > countries.txt


