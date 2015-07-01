require "service_status/version"
require "httparty"

module ServiceStatus
  include HTTParty
  base_uri 'localhost:3000/api/1'

  def self.get_status
    get("/reports/current_status").parsed_response
  end

  def self.get_reports
    get("/reports").parsed_response
  end

  def self.signup(email, password)
    body = {email: email, password: password}
    post("/signup", body: body).parsed_response
  end

  def self.login(email, password)
    body = {email: email, password: password}
    post("/login", body: body).parsed_response
  end

  def self.create_report(access_token, status = nil, message = nil)
    body = {status: status, message: message}
    headers = {'Authorization' => access_token}
    post("/reports", body: body, headers: headers).parsed_response
  end
end
