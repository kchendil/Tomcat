#
# Cookbook Name:: nags
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe "java"
tomcat_version = node['tomcat']['tomcat_version']
tomcat_install_loc=node['tomcat']['tomcat_install_loc']

#convert version number to a string if it isn't already
if tomcat_version.instance_of? Fixnum
  tomcat_version = tomcat_version.to_s
end

case tomcat_version
when "6"
tomcat_url = node['tomcat']['tomcat_url_6']
script "Download Apache Tomcat 6 " do
  interpreter "bash"
  user "vagrant"
  cwd "/tmp"
  code <<-EOH
  wget #{tomcat_url} -O /tmp/tomcat_pag.txt
  url=`grep -m 1 apache-tomcat-6.*.[0-9][0-9].tar.[g][z] /tmp/tomcat_pag.txt | cut -d '"' -f 2`
  wget $url 
  mkdir -p #{tomcat_install_loc}/tomcat6
  filename=`echo ${url#*bin\/}`
  filename2=`echo "${filename:0:(${#filename}-7)}"`
  export TOMCAT_FILE=$filename2
  EOH
end

execute "Unzip Apache Tomcat 6 binary file" do
 user "vagrant"
 installation_dir = "/tmp"
 cwd installation_dir
 command "tar zxvf /tmp/apache-tomcat-6.*.tar.gz -C #{tomcat_install_loc}/tomcat6" 
 action :run
end
execute "Change the directory name to apache-tomcat-6" do
 user "vagrant" 
 cwd #{tomcat_install_loc}/tomcat6
 command "cd #{tomcat_install_loc}/tomcat6; mv apache-tomcat-6.* apache-tomcat-6"
 action :run
end


template "#{tomcat_install_loc}/tomcat6/apache-tomcat-6/conf/server.xml" do
  source "server6.xml.erb"
  owner "vagrant" 
  mode "0644"  
end
template "/etc/rc.d/tomcat6" do
  source "tomcat6.erb"
  owner "root" 
  mode "0755"  
end

execute "start tomcat 6" do
 user "vagrant" 
 command "/etc/init.d/tomcat6 start" 
 action :run
end

when "7"
tomcat_url = node['tomcat']['tomcat_url_7']
script "Download Apache Tomcat 7 " do
  interpreter "bash"
  user "vagrant"
  cwd "/tmp"
  code <<-EOH
  wget #{tomcat_url} -O /tmp/tomcat_pag.txt
  url=`grep -m 1 apache-tomcat-7.*.[0-9][0-9].tar.[g][z] /tmp/tomcat_pag.txt | cut -d '"' -f 2`
  wget $url 
  mkdir -p #{tomcat_install_loc}/tomcat7
  filename=`echo ${url#*bin\/}`
  filename2=`echo "${filename:0:(${#filename}-7)}"`
  export TOMCAT_FILE=$filename2
  EOH
end

execute "Unzip Apache Tomcat 7 binary file" do
 user "vagrant"
 installation_dir = "/tmp"
 cwd installation_dir
 command "tar zxvf /tmp/apache-tomcat-7.*.tar.gz -C #{tomcat_install_loc}/tomcat7" 
 action :run
end
execute "Change the directory name to apache-tomcat-7" do
 user "vagrant" 
 cwd #{tomcat_install_loc}/tomcat7
 command "cd #{tomcat_install_loc}/tomcat7; mv apache-tomcat-7.* apache-tomcat-7"
 action :run
end


template "#{tomcat_install_loc}/tomcat7/apache-tomcat-7/conf/server.xml" do
  source "server7.xml.erb"
  owner "vagrant" 
  mode "0644"  
end
template "/etc/rc.d/tomcat7" do
  source "tomcat7.erb"
  owner "root" 
  mode "0755"  
end

execute "start tomcat 7" do
 user "vagrant" 
 command "/etc/init.d/tomcat7 start" 
 action :run
end
end


