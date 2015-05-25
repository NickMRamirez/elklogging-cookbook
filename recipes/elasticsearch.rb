#
# Cookbook Name:: elklogging
# Recipe:: elasticsearch
#
# Copyright (c) 2015 Nick Ramirez, All Rights Reserved.

apt_package "openjdk-7-jdk"

version = node['elasticsearch']['version']

apt_repository 'elasticsearch' do
  uri "http://packages.elasticsearch.org/elasticsearch/#{version}/debian"
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  components ['stable', 'main']
end

apt_package 'elasticsearch'

service 'elasticsearch' do
  action [:enable, :start]
end