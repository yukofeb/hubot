namespace :hubot do
  task :start do
      cmd = "forever start -c sh bin/hubot -a slack"
      `#{cmd}`
  end

  task :restart do
      cmd = "forever restartall"
      `#{cmd}`
  end

  after 'deploy:published', 'hubot:restart'
end
