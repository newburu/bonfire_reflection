# config valid for current version and patch releases of Capistrano
lock "~> 3.20.0"

set :application, "bonfire_reflection"
set :repo_url, "https://github.com/newburu/bonfire_reflection.git"
# rbenvのパスを明示的に指定します
set :rbenv_path, "/usr/local/src/rbenv"

# Default branch is :master
set :branch, "main"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/bonfire_reflection"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/master.key", ".env"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage", "node_modules"

# Default value for default_env is {}
set :default_env, {
  path: "/usr/bin:./node_modules/.bin:$PATH",
  node_env: "production"
}

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
