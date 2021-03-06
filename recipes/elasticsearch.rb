#
# Cookbook Name:: elklogging
# Recipe:: elasticsearch
#
# Copyright (c) 2015 Nick Ramirez, All Rights Reserved.

include_recipe 'java'

version = node['elasticsearch']['version']

apt_repository 'elasticsearch' do
  uri "https://packages.elastic.co/elasticsearch/#{version}/debian"
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  distribution ''
  components ['stable', 'main']
end

apt_package 'elasticsearch' 

cookbook_file '/etc/elasticsearch/elasticsearch.yml'

service 'elasticsearch' do
  supports [ :status ]
  action [:enable, :start]
end
