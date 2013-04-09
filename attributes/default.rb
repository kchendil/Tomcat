#
# Cookbook Name:: tomcat_latest
# Attributes:: default
#
# Copyright 2013, Chendil Kumar Manoharan
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

default['tomcat']['tomcat_url_7'] = "http://tomcat.apache.org/download-70.cgi"
default['tomcat']['tomcat_url_6'] = "http://tomcat.apache.org/download-60.cgi"
default['tomcat']['tomcat_install_loc'] = "/tmp/apache"
default['tomcat']['tomcat_version'] = '7'
default["tomcat"]["port"] = 8080
default["tomcat"]["ssl_port"] = 8443
default["tomcat"]["ajp_port"] = 8009
default["tomcat"]["java_options"] = "-Xmx128M -Djava.awt.headless=true"
default["tomcat"]["use_security_manager"] = false
default["tomcat"]["authbind"] = "no"

case platform
when "suse"
 default["tomcat"]["user"] = "vagrant"
default["tomcat"]["group"] = "vagrant"
default["tomcat"]["home"] = "#{tomcat["tomcat_install_loc"]}/tomcat6/apache-tomcat-6.0.36"
default["tomcat"]["base"] = "#{tomcat["tomcat_install_loc"]}/tomcat6/apache-tomcat-6.0.36"
default["tomcat"]["config_dir"] = "#{tomcat["tomcat_install_loc"]}/tomcat6/apache-tomcat-6.0.36/conf"
default["tomcat"]["log_dir"] = "#{tomcat["tomcat_install_loc"]}/tomcat6/apache-tomcat-6.0.36/logs"
default["tomcat"]["tmp_dir"] = "#{tomcat["tomcat_install_loc"]}/tomcat6/apache-tomcat-6.0.36/temp"
default["tomcat"]["work_dir"] = "#{tomcat["tomcat_install_loc"]}/tomcat6/apache-tomcat-6.0.36/work"
default["tomcat"]["context_dir"] = "#{tomcat["config_dir"]}/Catalina/localhost"
default["tomcat"]["webapp_dir"] = "#{tomcat["tomcat_install_loc"]}/tomcat6/apache-tomcat-6.0.36/webapps"
end
