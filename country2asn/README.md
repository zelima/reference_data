# Country2ASN

We use the wonderful [stat.ripe.net API](https://stat.ripe.net/docs/data_api) to periodically fetch country to ASN mappings in order to keep an offline version of it for reference data purposes (quick offline lookups, etc).



# DB structure

See the file ``db.sql``

Basically, we have one single table called ``country_asn`` which holds an ISO 2 letter country code and an ASN. Historic data is kept via a timestamp ("ts") field.


# Output

The script ``gen-output.sh`` is used for generating a file which can be uploaded to a webserver/github.


# Caveat

**Be very careful not to make the following mistake**

*Do not geolocate IP addresses and then do a lookup country code to ASN and therefore determine that the particular IP address is in this ASN.*

While this approach looks natural at first, it is wrong. 

**Reason**: the ASN data here in these scripts is fetched from the RIR (Regional Internet Registry) - RIPENCC. This registry simply records IP / ASN address *assignment to organisations* (and the location of these organisations). This does **not** automatically imply which organisation (ASN) actually currently *announces a netblock* (and therefore the given IP address).
There might be legitimate reasons for announcing specific netblocks (for example if done so under contract by the ASN owner). There might be illegimate reasons to ("hijacking") wrongly announce netblocks. In any case, the BGP table is the only valid place to look up correct IP address to AS numbers matchings since the BGP table describes routing.
If you want to do some IP 2 ASN lookups, please consult other services such as [pyasn](https://github.com/hadiasghari/pyasn) or [team cymru](https://www.team-cymru.org/IP-ASN-mapping.html).

# How to automate

See ``crontab.sample.txt``


