#!/usr/bin/env bats

@test "should have embedded ruby" {
  [ -x "/opt/sensu/embedded/bin/ruby" ]
}

@test "should have rabbitmq running" {
  [ "$(ps aux | grep rabbitmq_server | grep -v grep)" ]
}

@test "rabbitmq should be listening for connections" {
  [ "$(netstat -plant | grep beam)" ]
}

@test "should have redis-server running" {
  [ "$(ps aux | grep redis-server | grep -v grep)" ]
}

@test "redis-server should be listening for connections" {
  [ "$(netstat -plant | grep redis-server)" ]
}

@test "should have sensu server running" {
  [ "$(ps aux | grep sensu-server | grep -v grep)" ]
}

@test "should have sensu api running" {
  [ "$(ps aux | grep sensu-api | grep -v grep)" ]
}

@test "should have sensu uchiwa running" {
  [ "$(ps aux | grep uchiwa | grep -v grep)" ]
}

@test "should have sensu client running" {
  [ "$(ps aux | grep sensu-client | grep -v grep)" ]
}

@test "should have a ssh check definition" {
  [ -e "/etc/sensu/conf.d/checks/ssh.json" ]
}
