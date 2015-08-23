namespace :hubot do
  task :start do
      cmd = "export PATH=/usr/bin:$PATH forever start -c sh bin/hubot -a slack"
      `#{cmd}`
  end

  task :restart do
      cmd = "export PATH=/usr/bin:$PATH forever restartall"
      `#{cmd}`
  end

  after 'deploy:published', 'hubot:restart'
end
