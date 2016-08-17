#!/usr/bin/env python3

import sys
import csv

reader = csv.reader(sys.stdin, delimiter=',', quotechar='"', skipinitialspace=True)
for row in reader:
    print (row[3])

