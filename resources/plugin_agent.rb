#
# Cookbook Name:: newrelic-ng
# Resource:: plugin_agent
#
# Copyright 2012, Chris Aumann
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

actions        :configure
default_action :configure

attribute :license_key,    kind_of: String,  name_attribute: true
attribute :poll_interval,  kind_of: Integer, default: node['newrelic-ng']['plugin-agent']['poll_interval']
attribute :pidfile,        kind_of: String,  default: node['newrelic-ng']['plugin-agent']['pidfile']
attribute :logfile,        kind_of: String,  default: node['newrelic-ng']['plugin-agent']['logfile']
attribute :service_config, kind_of: String,  default: node['newrelic-ng']['plugin-agent']['service_config']

attribute :owner,          kind_of: String, default: node['newrelic-ng']['user']['name']
attribute :group,          kind_of: String, default: node['newrelic-ng']['user']['group']
attribute :shell,          kind_of: String, default: node['newrelic-ng']['user']['shell']
attribute :system,         kind_of: String, default: node['newrelic-ng']['user']['system']

attribute :mode,           kind_of: String,  default: node['newrelic-ng']['plugin-agent']['mode']
attribute :config_file,    kind_of: String,  default: node['newrelic-ng']['plugin-agent']['config_file']

attribute :cookbook,       kind_of: String,  default: 'newrelic-ng'
attribute :source,         kind_of: String,  default: 'plugin-agent.yaml.erb'
