#
# Cookbook Name:: techdivision-databaseserver
# Recipe:: default
# Author:: Robert Lemke <r.lemke@techdivision.com>
#
# Copyright (c) 2014 Robert Lemke, TechDivision GmbH
#
# Licensed under the MIT License (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://opensource.org/licenses/MIT
#

#
# MySQL Server
#
# Note that ruby-dev must be installed on the base box already in order to compile
# mysql::ruby which in turn is necessary for database::mysql

include_recipe "mysql::server"
include_recipe "database::mysql"

template "/etc/mysql/conf.d/charset.cnf" do
  source "charset.cnf.erb"
  notifies :restart, "mysql_service[default]"
end
