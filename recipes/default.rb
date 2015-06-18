template "motd" do
  path "#{node[:motd][:dir]}/motd"
  source "motd.erb"
  #owner "root"
  #group "root"
  #mode "0644"
  #notifies :restart, resources(:service => "redis")
end
