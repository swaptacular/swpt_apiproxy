Swaptacular Web API reverse proxy
=================================

This project implements a load balancing reverse proxy that forwards
[Swaptacular] Web API requests to servers. It is intended to be used when
several instances ([shards]) of [Accounting Authority], [Creditors Agent],
or [Debtors Agent] Web API servers are deployed. The ultimate deliverable is
a [docker image], generated from the project's
[Dockerfile](../master/Dockerfile).


Configuration
-------------

The behavior of the running container can be tuned with environment
variables. Here are the most important settings with some random
example values:

```shell
# To configure a "Creditors Agent" proxy, the MIN_CREDITOR_ID and
# MAX_CREDITOR_ID environment variables must be set, indicating that the
# creditors agent will be responsible for creditor IDs between
# "$MIN_CREDITOR_ID" and "$MAX_CREDITOR_ID".
MIN_CREDITOR_ID=4294967296
MAX_CREDITOR_ID=8589934591

# To configure a "Debtors Agent" proxy, the MIN_DEBTOR_ID and
# MAX_DEBTOR_ID environment variables must be set, indicating that the
# debtors agent will be responsible for debtor IDs between
# "$MIN_DEBTOR_ID" and "$MAX_DEBTOR_ID".
MIN_DEBTOR_ID=4294967296
MAX_DEBTOR_ID=8589934591

# To configure an "Accounting Authority" proxy, *none of the*
# MIN_CREDITOR_ID, MAX_CREDITOR_ID, MIN_DEBTOR_ID and MAX_DEBTOR_ID
# environment variables must be set.


# The proxy will listen for requests on port "$APIPROXY_PORT" (default
# 8080).
APIPROXY_PORT=8080

# The full path to the configuration file. Each line in the configuration file
# should contain a route specifier, and a web server URL, separated by at
# least one space. Route specifiers consist of zero or more 0s or 1s,
# separated by dots, ending with an asterisks ("*"). Example configuration
# files:
#
# 0.* http://first-server:8001/
# 1.* http://second-server:8001/
#
# or
#
# http://the-only-server:8002/
APIPROXY_CONFIG_FILE=/etc/apiproxy.conf
```


[Swaptacular]: https://swaptacular.github.io/overview [docker image]: https://www.geeksforgeeks.org/what-is-docker-images/
[shards]: https://en.wikipedia.org/wiki/Shard_(database_architecture)
[Accounting Authority]: https://github.com/swaptacular/swpt_accounts
[Creditors Agent]: https://github.com/swaptacular/swpt_creditors
[Debtors Agent]: https://github.com/swaptacular/swpt_debtors

