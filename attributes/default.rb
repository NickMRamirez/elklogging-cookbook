default['logstash']['version'] = '1.5'
default['elasticsearch']['version'] = '1.5'

# Overrides for java cookbook
override['java']['install_flavor'] = 'openjdk'
override['java']['jdk_version'] = '7'