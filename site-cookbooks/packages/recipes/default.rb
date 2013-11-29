#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright 2013, Sean Porter Consulting
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
include_recipe "ntp"

node.override["ruby_installer"]["method"] = "source"
node.override["ruby_installer"]["source_version"] = "2.0.0-p353"
node.override["ruby_installer"]["source_rubygems_force"] = true

include_recipe "ruby_installer"

package "tmux"
package "git"

gem_package "bundler"

## Emacs
apt_repository "cassou-emacs" do
  uri "http://ppa.launchpad.net/cassou/emacs/ubuntu"
  distribution node.lsb.codename
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "CEC45805"
end

package "emacs24"

## Docker (LXC)
modules "aufs" do
  action :load
end

apt_repository "docker" do
  uri node["packages"]["docker"]["repo"]
  distribution "docker"
  components ["main"]
  key node["packages"]["docker"]["repo_key"]
end

template "/etc/init/docker.conf"

package "lxc-docker" do
  options "--force-yes -o Dpkg::Options::='--force-confdef'"
end
