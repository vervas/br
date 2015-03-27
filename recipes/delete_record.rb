include_recipe 'route53'

route53_record "create a record" do
  name  "#{node[:opsworks][:instance][:hostname]}.#{node[:opsworks][:stack][:name]}.example.com"
  type  "CNAME"
  zone_id               node[:dns_zone_id]
  aws_access_key_id     node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
  action :delete
end

