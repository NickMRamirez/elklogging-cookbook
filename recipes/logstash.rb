#
# Cookbook Name:: elklogging
# Recipe:: logstash
#
# Copyright (c) 2015 Nick Ramirez, All Rights Reserved.

include_recipe 'java'

version = node['logstash']['version']

apt_repository 'logstash' do
  uri "http://packages.elastic.co/logstash/#{version}/debian"
  key 'https://packages.elastic.co/GPG-KEY-elasticsearch'
  components ['stable', 'main']
end

apt_package 'logstash'

cookbook_file '/etc/logstash/conf.d/redis_to_elasticsearch.conf'

service 'logstash' do
  supports [ :status ]
  action [:enable, :start]
end
