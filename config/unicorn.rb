worker_processes 1
listen "/tmp/webdev.sock", :backlog => 64
timeout 30
stderr_path "/home/webdev/log/unicorn.log"
stdout_path "/home/webdev/log/unicorn.log"
pid "/home/webdev/tmp/pids/unicorn.pid"
