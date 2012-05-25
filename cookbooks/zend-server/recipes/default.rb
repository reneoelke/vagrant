#
# Cookbook Name:: zend-server
# Recipe:: default
#
# Copyright 2012, foobugs Oelke & Eichner GbR
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apt"

apt_repository "zend-server" do
  uri "#{node['zend-server']['repo_uri']}"
  distribution "server"
  components [ "non-free" ]
  key "#{node['zend-server']['repo_key']}"
  action :add
end

package "zend-server-ce-php-#{node['zend-server']['php_version']}" do
  action :install
#  notifies :run, "execute[zend-setup-show-eula]", :immediately
#  notifies :run, "execute[zend-setup-accept-eula]", :immediately
  notifies :run, "execute[zend-setup-set-password]", :immediately
end

#execute "zend-setup-show-eula" do
#  command "/usr/local/zend/bin/zs-setup show-eula"
#  ignore_failure false
#end

#execute "zend-setup-accept-eula" do
#  command "/usr/local/zend/bin/zs-setup accept-eula"
#  ignore_failure false
#end

execute "zend-setup-set-password" do
  command "/usr/local/zend/bin/zs-setup set-password #{node['zend-server']['gui_password']}"
  ignore_failure false
end

service "zend-server" do
  service_name "zend-server"
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

cookbook_file "/etc/profile.d/zend_server.sh" do
  source "zend_server.sh"
  owner "root"
  group "root"
  mode "0644"
end
