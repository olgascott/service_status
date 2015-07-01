require 'spec_helper'

describe ServiceStatus do
  def base_uri
    'http://localhost:3000/api/1'
  end

  it "has a version number" do
    expect(ServiceStatus::VERSION).not_to be nil
  end

  describe "self.get_status" do
    it "should send a get request to the correct url" do
      stub_request(:get, "#{base_uri}/reports/current_status").to_return(:status => 200, :body => "test string")
      expect(ServiceStatus.get_status).to eq 'test string'
    end
  end

  describe "self.get_reports" do
    it "should send a get request to the correct url" do
      stub_request(:get, "#{base_uri}/reports").to_return(:status => 200, :body => "test string")
      expect(ServiceStatus.get_reports).to eq 'test string'
    end
  end

  describe "self.signup" do
    it "should send a post request to the correct url with correct params" do
      stub_request(:post, "#{base_uri}/signup")
        .with(body: {email: 'test@example.com', password: '123123'})
        .to_return(:status => 200, :body => "test string")
      expect(ServiceStatus.signup('test@example.com', '123123')).to eq 'test string'
    end
  end

  describe "self.login" do
    it "should send a post request to the correct url with correct params" do
      stub_request(:post, "#{base_uri}/login")
        .with(body: {email: 'test@example.com', password: '123123'})
        .to_return(:status => 200, :body => "test string")
      expect(ServiceStatus.login('test@example.com', '123123')).to eq 'test string'
    end
  end

  describe "self.create_report" do
    it "should send a post request to the correct url with correct params" do
      stub_request(:post, "#{base_uri}/reports")
        .with(body: {status: 'up', message: "test message"}, headers: {'Authorization' => 'test'})
        .to_return(:status => 200, :body => "test string")
      expect(ServiceStatus.create_report('test', 'up', 'test message')).to eq 'test string'
    end
  end
end
