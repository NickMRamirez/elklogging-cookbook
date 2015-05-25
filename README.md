# elklogging

About
=====
A simple library that installs logstash, elasticsearch and redis
as services. It tries to reduce the number of cookbook dependencies,
which so often become unhinged. Elasticsearch listens on port
9200 and redis listens on port 6379.

It does not currently install kibana, but will in the future.

Tested on
=========
 * Ubuntu 14.10
	
Recipes
=======
Recipes that you can use are:

 * default - installs everything with default attributes
 * logstash - installs only logstash as a service
 * elasticsearch - installs only elasticsearch as a service
 
Attributes
==========
  * `['elasticsearch']['version']` - sets the version of the package to install
  * `['logstash']['version']` - sets the version of the package to install


