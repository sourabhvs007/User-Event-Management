set :stage, :it
set :branch, :master
set :deploy_to, '/'
set :user, "root"

role :app, %w{root@user-event-management-1}
role :web, %w{root@user-event-management-1}
role :db,  %w{root@user-event-management-1}
server 'user-event-management-1', roles: %w{:web, :app, :db}, user: 'deploy'

set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    auth_methods: %w(publickey)
  }
