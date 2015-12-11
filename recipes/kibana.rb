
version = node['kibana']['version']

apt_repository 'kibana' do
  uri "http://packages.elasticsearch.org/kibana/#{version}/debian"
  key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  components ['stable', 'main']
end

apt_package 'kibana'

service 'kibana' do
  supports [ :status ]
  action [ :enable, :start ]
end