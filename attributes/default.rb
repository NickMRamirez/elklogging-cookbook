default['logstash']['version'] = '2.1'
default['elasticsearch']['version'] = '2.x'

# Overrides for java cookbook
override['java']['install_flavor'] = 'openjdk'
override['java']['jdk_version'] = '7'