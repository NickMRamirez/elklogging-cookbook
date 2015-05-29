kibana_package = 'https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz'
kibana_file = File.basename(kibana_package)
kibana_local_file = "#{Chef::Config[:file_cache_path]}/#{kibana_file}"

directory '/opt/kibana'

remote_file kibana_local_file do
  source kibana_package
  notifies :run, "execute[extract_file]", :immediately
end

execute 'extract_file' do
  command "tar xzf #{kibana_local_file} -C /opt/kibana --strip-components 1"
  action :nothing
end

# file must have unix-style line endings
cookbook_file '/etc/init.d/kibana' do
  mode "700"
end

service 'kibana' do
  supports [ :status ]
  action [ :enable, :start ]
end