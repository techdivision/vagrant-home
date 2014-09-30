#
# Cookbook Name:: techdivision-ssh
# Provider:: authorized_keys_entry
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

action :create do

    # FIXME: make path configurable through "user" attribute:
  authorizedKeysPath = "/root/.ssh/"
  authorizedKeysFilename = "authorized_keys"
  authorizedKeysPathAndFilename = "#{authorizedKeysPath}#{authorizedKeysFilename}"

  recipe_eval do

    directory "#{authorizedKeysPath}" do
      user new_resource.user
      group "root"
      mode 00700
    end

  end

  # Ensure that the file exists and has minimal content (required by Chef::Util::FileEdit)
  file authorizedKeysPathAndFilename do
    action :create
    backup false
    content '# Authorized keys, managed by Chef'
    user new_resource.user
    group "root"
    mode 00600
    only_if do
      !::File.exists?(authorizedKeysPathAndFilename) || ::File.new(authorizedKeysPathAndFilename).readlines.length == 0
    end
  end

  ruby_block "add #{new_resource.key} to #{authorizedKeysPathAndFilename}" do
    block do
      file = ::Chef::Util::FileEdit.new(authorizedKeysPathAndFilename)
      file.insert_line_if_no_match(/#{Regexp.escape(new_resource.key)}/, new_resource.key)
      file.write_file
    end
  end
  new_resource.updated_by_last_action(true)
end
