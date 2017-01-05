Vagrant.configure(2) do |config|

  # Start influxdb VM configuration
  config.vm.define "influxdb", autostart: true, primary: true do |influx|
    influx.vm.box = "bento/centos-7.2"

    # set the hostname
    influx.vm.hostname = "influxdb"

    # Configuration private networking
    influx.vm.network "private_network", ip: '10.0.0.10'
    # Configure port forwarding - visit port 8080 to use port 80 on VM
    influx.vm.network "forwarded_port", guest: 8083, host: 8080
    influx.vm.network "forwarded_port", guest: 8086, host: 8090

    # Set memory
    influx.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    # Run ansible playbook
    influx.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/kub-master.yml"
    end
  end
  # End master VM configuration
end
