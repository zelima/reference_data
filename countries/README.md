# TODO 


Please add mechanisms to automatically update countries.txt via cronjob.

The source of the data shall be some reliable , official source.
Datapackages are of course fine as well, as long as we have a current file called "countries.txt" in the format:

```
<iso2letter country code, upper case>
<iso2letter country code, upper case>
<iso2letter country code, upper case>
<iso2letter country code, upper case>
....
```

(\n separated Unix text file)

# Example

```
AT
DE
GB
US
```

