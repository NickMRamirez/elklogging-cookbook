#
# Cookbook Name:: elklogging
# Recipe:: logstash
#
# Copyright (c) 2015 Nick Ramirez, All Rights Reserved.

version = node['elasticsearch']['version']

apt_repository 'logstash' do
  uri "http://packages.elasticsearch.org/logstash/#{version}/debian"
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  components ['stable', 'main']
end

apt_package 'logstash'

cookbook_file '/etc/logstash/conf.d/redis_to_elasticsearch.conf'

service 'logstash' do
  action [:enable, :start]
end