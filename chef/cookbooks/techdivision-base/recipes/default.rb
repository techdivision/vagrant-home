#
# Cookbook Name:: techdivision-base
# Recipe:: default
# Author:: Robert Lemke <r.lemke@techdivision.com>
#
# Copyright (c) 2014 Robert Lemke, TechDivision GmbH

#
# Locales
#

execute "locale-gen" do
  action :nothing
  command "locale-gen --purge"
end

case node["platform_family"]
when "debian"
  file "/etc/locale.gen" do
    action :create
    owner "root"
    group "root"
    mode "0644"
    content node["techdivision-base"]["locales"].join("\n") + "\n"
    notifies :run, "execute[locale-gen]", :immediate
  end
else
  file "/var/lib/locales/supported.d/en" do
    action :delete
  end

  file "/var/lib/locales/supported.d/local" do
    action :create
    owner "root"
    group "root"
    mode "0644"
    content node["techdivision-base"]["locales"].join("\n") + "\n"
    notifies :run, "execute[locale-gen]", :immediate
  end
end

#
# Authorized Keys
#

administrators = search(:administrators)
administrators.each do |administrator|
  techdivision_ssh_authorized_keys_entry administrator["emailAddress"] do
    key administrator["sshKey"]
    user "root"
  end
end

#
# Packages you always need
#

package "ca-certificates" do
  action :install
end

package "sudo" do
  action :install
end

package "zip" do
  action :install
end

package "mc" do
  action :install
end

package "zsh" do
  action :install
end

package "ntp" do
  action :install
end

#
# ZSH for "root"
#

template "zshrc.erb" do
  cookbook "techdivision-base"
  path "/root/.zshrc"
  source "zshrc.erb"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end


#
# Enable ACL support
#

techdivision_base_acl "/"

#
# Vagrant support
#

if node["vagrant"] then

  user "vagrant" do
    shell "/bin/zsh"
  end

  group "www-data" do
    action :manage
    append true
    members "vagrant"
  end

  template "zshrc.erb" do
    cookbook "techdivision-base"
    path "/home/vagrant/.zshrc"
    source "zshrc.erb"
    owner "vagrant"
    group "vagrant"
    mode "0644"
  end

end
