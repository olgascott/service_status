$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'service_status'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: false)
