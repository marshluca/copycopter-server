#!/usr/bin/env puma

directory '/home/lucas/copycopter-server'
environment 'production'
daemonize true
pidfile "/home/lucas/copycopter-server/tmp/pids/puma.pid"
state_path "/home/lucas/copycopter-server/tmp/pids/puma.state"
stdout_redirect '/home/lucas/copycopter-server/log/puma_access.log', '/home/lucas/copycopter-server/log/puma_error.log', true
threads 0,16
bind "unix:///home/lucas/copycopter-server/tmp/sockets/puma.sock"

workers 2

preload_app!


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/lucas/copycopter-server/Gemfile"
end