$:.unshift File.dirname(__FILE__) + '/bundle'
require 'puppet'
require 'pp'

Puppet[:environment] = 'master'
Puppet[:manifest] = 'site.pp'
Puppet[:modulepath] = 'modules/'

Puppet.settings.initialize_app_defaults({
  :logdir     => "/dev/null",
  :confdir    => "/dev/null",
  :vardir     => "/dev/null",
  :rundir     => "/dev/null",
  :hiera_config => "/dev/null",
})
node = Puppet::Node.indirection.find(Puppet[:node_name_value])

catalog = Puppet::Resource::Catalog.indirection.find(node.name, :use_node => node)
pp catalog.classes.reject { |c| c == 'settings' }

