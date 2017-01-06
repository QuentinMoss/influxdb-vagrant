Vagrant.configure(2) do |config|

  # Start influxdb VM configuration
  config.vm.define "influxdb", autostart: true, primary: true do |influx|
    influx.vm.box = "bento/centos-7.2"

    # set the hostname
    influx.vm.hostname = "influxdb"

    # Configuration private networking
    influx.vm.network "private_network", ip: '10.0.0.10'
    influx.vm.network "forwarded_port", guest: 8888, host: 8080

    # Set memory
    influx.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    # Run ansible playbook
    influx.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/install-influxdb.yml"
    end
  end
  # End influxdb VM configuration
end
