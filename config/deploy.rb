set :application, 'animatedgifme'
set :repo_url, 'git@github.com:excid3/animatedgif.me.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/deploy/animatedgifme'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'

  task :bundle_install do
    on roles(:app) do
      within release_path do
        execute :bundle, "--gemfile Gemfile --path #{shared_path}/bundle --quiet --binstubs #{shared_path}bin --without [:test, :development]"
      end
    end
  end
after 'deploy:updating', 'deploy:bundle_install'
end
