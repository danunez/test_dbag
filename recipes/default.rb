nagiosData = search(:dsw_nagios, "id:default")
nagiosData.at(0)["profiles"].each {|x|
	puts x["host"]
	puts x["profile"]
}


template "motd" do
  path "#{node[:motd][:dir]}/motd"
  source "motd.erb"
  variables :test => nagiosData.at(0)["profiles"]
  #owner "root"
  #group "root"
  #mode "0644"
  #notifies :restart, resources(:service => "redis")
end
