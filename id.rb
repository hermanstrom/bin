#!/usr/bin/ruby
#
# $Id: id.rb,v 0.1 2017-06-4 13:45:35 hermanstrom Exp $
#

lxc = {
  # MAC Addresses 
  :mac_addrs => ["080027ca588b", "08002781174f"],

  # Nodes 
  :nodes => ['san', 'node1', 'node2'],

  # Disks 
  :disks => {
    :name => 'san.vdi',
    :san {}
  },

  # Provision
  :provision => {
  	:shell => {
  		:san 	=> ['sudo apt-get update && sudo apt-get -y install iscsitarget{,-dkms}'], 
  		:node => ['sudo apt-get update && sudo apt-get -y install open-iscsi']
  	}
  }
}

lxc[:disks][:san] = {
  :createdisk => ['createhd', '--filename', lxc[:disks][:name], '--size', 146*10**9/2**20],
  :attachdisk => ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 0, '--device', 1, '--type', 'hdd', '--medium', lxc[:disks][:name]]
}

puts "#{lxc};\n"

lxc[:nodes].each do |id| 
	puts "#{id}; "
end

#N = 1
#(0..N).each do |id|
#  puts "#{id};"
#end

#(0..N).each { |id| puts "#{id};" }

exit 0