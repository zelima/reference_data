#!/bin/sh

COUNTRIES=../countries/countries.txt

URL='https://stat.ripe.net/data/country-resource-list/data.json?resource='
DATE=$(date "+%Y/%m/%d")

rm -f import.csv

for CC in $(cat ${COUNTRIES}); do
    asns=$(curl -s ${URL}${CC} | jq ".data.resources.asn |  @tsv" | sed 's/\\t/ /g' | sed 's/"//g' ) > /dev/null
    printf "${CC},%s,${DATE}\n" $asns >> import.csv
done


egrep -v "[A-Z]{2},," import.csv > i
mv i import.csv

psql --quiet iphistory -c "copy country_asn from STDIN with CSV delimiter ','" < import.csv


