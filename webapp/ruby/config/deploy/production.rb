set :stage, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# role :app, %w{deploy@example.com}
# role :web, %w{deploy@example.com}
# role :db, %w{deploy@example.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a has can be used to set
# extended properties on the server.
# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

server '203.104.111.161', user: 'isucon', roles: 'db'
server '203.104.111.162', user: 'isucon', roles: ['app', 'bench']
server '203.104.111.163', user: 'isucon', roles: 'app'

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
set :ssh_options, {
 keys: %w(~/.ssh/id_rsa.isucon),
 forward_agent: true,
 auth_methods: %w(publickey)
}
# and/or per server
# server 'example.com',
# user: 'user_name',
# roles: %w{web app},
# ssh_options: {
# user: 'user_name', # overrides user setting above
# keys: %w(/home/user_name/.ssh/id_rsa),
# forward_agent: false,
# auth_methods: %w(publickey password)
# # password: 'please use keys'
# }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :production)
# # Simple Role Syntax
# # ==================
# # Supports bulk-adding hosts to roles, the primary server in each group
# # is considered to be the first unless any hosts have the primary
# # property set.  Don't declare `role :all`, it's a meta role.

# role :app, %w{deploy@example.com}
# role :web, %w{deploy@example.com}
# role :db,  %w{deploy@example.com}


# # Extended Server Syntax
# # ======================
# # This can be used to drop a more detailed server definition into the
# # server list. The second argument is a, or duck-types, Hash and is
# # used to set extended properties on the server.

# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value


# # Custom SSH Options
# # ==================
# # You may pass any option but keep in mind that net/ssh understands a
# # limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
# #
# # Global options
# # --------------
# #  set :ssh_options, {
# #    keys: %w(/home/rlisowski/.ssh/id_rsa),
# #    forward_agent: false,
# #    auth_methods: %w(password)
# #  }
# #
# # And/or per server (overrides global)
# # ------------------------------------
# # server 'example.com',
# #   user: 'user_name',
# #   roles: %w{web app},
# #   ssh_options: {
# #     user: 'user_name', # overrides user setting above
# #     keys: %w(/home/user_name/.ssh/id_rsa),
# #     forward_agent: false,
# #     auth_methods: %w(publickey password)
# #     # password: 'please use keys'
# #   }
