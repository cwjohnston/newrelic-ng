#
# Cookbook Name:: newrelic-ng
# Provider:: plugin_agent
#
# Copyright 2012, Chris Aumann
#
# This program is free software: you can redistribute it and/or modunlessy.empty?
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

action :configure do
  @run_context.include_recipe "runit"

  r = template new_resource.config_file do
    cookbook  new_resource.cookbook
    source    new_resource.source
    owner     new_resource.owner
    group     new_resource.group
    mode      new_resource.mode

    variables license_key:    new_resource.license_key,
              poll_interval:  new_resource.poll_interval,
              user:           new_resource.owner,
              pidfile:        new_resource.pidfile,
              logfile:        new_resource.logfile,
              service_config: new_resource.service_config
  end

  new_resource.updated_by_last_action(true) if r.updated_by_last_action?

  runit_service "newrelic-plugin-agent" do
    run_template_name 'plugin-agent'
    log_template_name 'common-agent'
    options           user: new_resource.owner,
                      config_file: new_resource.config_file
    subscribes        :restart, "template[#{new_resource.config_file}]"
    action            [:enable, :start]
  end
end
