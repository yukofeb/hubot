namespace :hubot do
  task :start do
      cmd = "/usr/bin/forever start -c sh bin/hubot -a slack"
      info "execute command : #{cmd}"
      `#{cmd}`
  end

  task :restart do
      cmd = "/usr/bin/forever restartall"
      info "execute command : #{cmd}"
      `#{cmd}`
  end

  after 'deploy:published', 'hubot:restart'
end
