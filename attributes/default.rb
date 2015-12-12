default['logstash']['version'] = '2.1'
default['elasticsearch']['version'] = '2.x'
default['kibana']['version'] = '4.3.0'

# Overrides for java cookbook
override['java']['install_flavor'] = 'openjdk'
override['java']['jdk_version'] = '8'