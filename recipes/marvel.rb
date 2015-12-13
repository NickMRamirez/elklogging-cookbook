file '/usr/share/elasticsearch/marvel_installed.txt' do
  content 'Marvel is installed'
  notifies :run, 'execute[install_license]', :immediately
end

execute 'install_license' do
  command '/usr/share/elasticsearch/bin/plugin install license'
  action :nothing
  notifies :run, 'execute[install_marvel]', :immediately
end

execute 'install_marvel' do
  command '/usr/share/elasticsearch/bin/plugin install marvel-agent'
  action :nothing
  notifies :run, 'execute[install_marvel_to_kibana]', :immediately
end

execute 'install_marvel_to_kibana' do
  action :nothing
  command '/opt/kibana/bin/kibana plugin --install elasticsearch/marvel/latest'
end