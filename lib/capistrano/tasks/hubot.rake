namespace :hubot do
  task :support_bundler do
    cmd = "cd #{current_path}"
    `#{cmd}`
    cmd = "sudo apt-get install bundler"
    `#{cmd}`
  end

  task :start do
      cmd = "export PATH=/usr/bin:$PATH forever start -c sh bin/hubot -a slack"
      `#{cmd}`
  end

  task :restart do
      cmd = "export PATH=/usr/bin:$PATH forever restartall"
      `#{cmd}`
  end

  before 'deploy:publishing', 'hubot:support_bundler'
  after 'deploy:published', 'hubot:restart'
end
