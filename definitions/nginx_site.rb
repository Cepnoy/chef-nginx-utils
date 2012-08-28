define :nginx_site do 
  if params[:action] == :enable
    service "nginx"
    link "/etc/nginx/sites-enabled/#{params[:name]}" do
      to "/etc/nginx/sites-available/#{params[:name]}"
      notifies :restart, resources(:service => "nginx")
      not_if do ::File.symlink?("/etc/nginx/sites-enabled/#{params[:name]}") end
    end
  elsif params[:action] == :disable
    service "nginx"
    link "/etc/nginx/sites-enabled/#{params[:name]}" do
      action :delete
      only_if "test -L /etc/nginx/sites-enabled/#{params[:name]}"
      notifies :restart, resources(:service => "nginx")
     end
  end
end
