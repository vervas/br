include_recipe 'route53'

route53_record "create a record" do
  name  "#{node[:opsworks][:instance][:hostname]}.#{node[:opsworks][:stack][:name]}.example.com"
  value node[:opsworks][:instance][:public_dns_name]
  type  "CNAME"
  ttl   60
  zone_id               node[:dns_zone_id]
  aws_access_key_id     node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
  overwrite true
  action :create
end
