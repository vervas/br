require 'net/http'
include_recipe 'route53'

route53_record "create a record" do
  name  "#{node[:opsworks][:instance][:name]}.#{node[:opsworks][:instance][:name]}.example.com"
  value node[:ec2][:public_hostname]
  type  "CNAME"
  ttl   60
  zone_id               node[:dns_zone_id]
  aws_access_key_id     node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
  overwrite true
  action :create
end

