# elklogging

About
=====
A simple library that installs logstash, elasticsearch and kibana
as services. It tries to reduce the number of cookbook dependencies,
which so often become unhinged. Services listen on the following ports:

 * elasticsearch - 9200
 * kibana - 5601

Tested on
=========
 * Ubuntu 14.10
 
System requirements
===================

 * 1024 mb RAM
	
Recipes
=======
Recipes that you can use are:

 * default - installs logstash, elasticsearch and kibana
 * logstash - installs logstash as a service
 * elasticsearch - installs elasticsearch as a service
 * kibana - installs kibana as a service
 * marvel - installs marvel
 
Attributes
==========
  * `['elasticsearch']['version']` - sets the version of the package to install
  * `['logstash']['version']` - sets the version of the package to install


