#
# Cookbook Name:: techdivision-base
# Resource:: acl
# Author:: Robert Lemke <r.lemke@techdivision.com>
#
# Copyright (c) 2014 Robert Lemke, TechDivision GmbH

actions :enable
default_action :enable

attribute :directory, :kind_of => String, :name_attribute => true

def initialize(*args)
  super
  @action = :enable
end
