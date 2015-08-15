namespace :ec2 do
  namespace :authenticate do
    MYSECURITYGROUP = "sg-34fc6d51"
    MYIP = `curl -s ifconfig.me`.chomp!

    task :add_ip do
      run_locally do
        cmd = "aws ec2 authorize-security-group-ingress --group-id #{MYSECURITYGROUP} --protocol tcp --port 22 --cidr #{MYIP}/32"
        info "execute command : #{cmd}"
        `#{cmd}`
      end
    end

    task :remove_ip do
      run_locally do
        cmd = "aws ec2 revoke-security-group-ingress --group-id #{MYSECURITYGROUP} --protocol tcp --port 22 --cidr #{MYIP}/32"
        info "execute command : #{cmd}"
        `#{cmd}`
      end
    end
  end

  before 'deploy:starting', 'ec2:authenticate:add_ip'
  after 'deploy:finished', 'ec2:authenticate:remove_ip'
end
