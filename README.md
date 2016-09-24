# csvsplitter
splits CSV files into smaller files

An example:

```
$ wc -l *
   44235 accounting.csv
    3476 inventory.csv
   10904 log.csv
   58615 total
```

Let's say I want to split only the two bigger files, accounting.csv and log.csv.

```
$ csvsplitter.pl accounting.csv log.csv
Processing accounting...
Processing log...
```

New files have been created:

```
$ wc -l *
   44235 accounting.csv
   10000 accounting-part1.csv
   10000 accounting-part2.csv
   10000 accounting-part3.csv
   10000 accounting-part4.csv
    4239 accounting-part5.csv
    3476 inventory.csv
   10904 log.csv
   10000 log-part1.csv
     905 log-part2.csv
  113759 total
```

Each partial CSV file contains the same header as the original big file.

