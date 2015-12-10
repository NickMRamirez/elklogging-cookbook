#
# Cookbook Name:: elklogging
# Recipe:: elasticsearch
#
# Copyright (c) 2015 Nick Ramirez, All Rights Reserved.

include_recipe 'java'

version = node['elasticsearch']['version']

apt_repository 'elasticsearch' do
  uri "http://packages.elasticsearch.org/elasticsearch/#{version}/debian"
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  components ['stable', 'main']
end

apt_package 'elasticsearch' do
  notifies :run, 'execute[install_marvel]', :immediately
end

execute 'install_marvel' do
  command '/usr/share/elasticsearch/bin/plugin install license'
  command '/usr/share/elasticsearch/bin/plugin install marvel-agent'
  action :nothing
end

service 'elasticsearch' do
  supports [ :status ]
  action [:enable, :start]
end