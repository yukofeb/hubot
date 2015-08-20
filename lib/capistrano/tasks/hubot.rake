namespace :hubot do
  task :start do
      cmd = "/usr/bin/forever start -c sh bin/hubot -a slack"
      `#{cmd}`
  end

  task :restart do
      cmd = "/usr/bin/forever restartall"
      `#{cmd}`
  end

  after 'deploy:published', 'hubot:restart'
end
