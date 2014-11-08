# config valid only for Capistrano 3.1
lock '3.2.1'

# set :application, 'my_app_name'
# set :repo_url, 'git@example.com:me/my_repo.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
 set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# namespace :deploy do

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       # execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end

#   after :publishing, :restart

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end

# end

set :application, ''
set :repo_url, 'git@github.com:tomoasleep/isucon4.git'
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :deploy_to, '/home/isucon/deploy'
set :scm, :git
# set :format, :pretty
# set :log_level, :debug
# set :pty, true
set :deploy_via, :remote_cache
# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5
namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path}/webapp/ruby;/home/isucon/env.sh bundle install"
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      # execute :rake, 'cache:clear'
      # end
    end
  end
  after :finishing, 'deploy:cleanup'
end

task :bench do
  on roles(:bench) do
    execute "/home/isucon/benchmarker bench --hosts 203.104.111.163 --workload 1"
  end
end

# after :bench do
#   on roles(:app) do
#     execute "mv /tmp/isucon.ruby.log #{Time.now}"
#   end
# end


namespace :db do
  task :refresh do
    on roles(:db) do
      execute :sudo, "rm -rf /var/www/html/webdav/*"
    end
  end
end

namespace :nginx do
  task :reload do
    on roles(:web) do
      execute :sudo, 'service nginx reload'
    end
  end
  task :restart do
    on roles(:web) do
      execute :sudo, 'service nginx restart'
    end
  end
  task :start do
    on roles(:web) do
      execute :sudo, 'service nginx start'
    end
  end
end
namespace :supervisor do
  task :restart do
    on roles(:app) do
      execute :sudo, 'supervisorctl restart isucon_ruby'
    end
  end
end
namespace :mysql do
  task :reload do
    on roles(:db) do
      execute :sudo, 'rm -f /tmp/slow-query.log'
      execute :sudo, 'service mysqld reload' # isucon2 ... mysqld
    end
  end
  task :restart do
    on roles(:db) do
      execute :sudo, 'rm -f /tmp/slow-query.log'
      execute :sudo, 'service mysqld restart' # isucon2 ... mysqld
    end
  end
end
