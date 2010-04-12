#############################################################
#	Application
#############################################################

set :application, "LimeLabx"
set :deploy_to, "/www-data/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
set :use_sudo, true

#############################################################
#	Servers
#############################################################

set :user, "nico"
set :domain, "10.247.64.103"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	GIT
#############################################################

set :repository,  "git@github.com:nicooorts/LimeLabx.git"
set :scm, "git"
set :scm_passphrase, "J2kH4l"
set :user, "limedeploy"

set :branch, "master"
set :deploy_via, :remote_cache
#############################################################
#	Passenger
#############################################################

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"



#set :scm, :subversion
#role :web, "Apache"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
#end
