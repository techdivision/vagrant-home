#
# Cookbook Name:: techdivision-sass
# Recipe:: default
# Author:: Robert Lemke <r.lemke@techdivision.com>
#
# Copyright (c) 2014 Robert Lemke, TechDivision GmbH
#

package "ruby1.9.3" do
  action :upgrade
end

gem_package "sass"

gem_package "compass"
