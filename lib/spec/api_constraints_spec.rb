require 'spec_helper'

describe ApiConstraints do 
    let(:api_constraints_v1) {ApiConstraints.new(version: 1)}
    let(:api_constraints_v2) {ApiConstraints.new(version: 2,default: true)}
end

describe "matches?" do

 it "returns true when the version matches the 'Accept' header " do
    request = double(host:'api.rails_api_2.dev',
                    headers: {"Accept" => "application/vnd.rails_api_2.v1"})
                    api_constraints_v1.matches?(request).should be_true
    end 
     
 
    it "returns the default version when 'default' option is specified" do
      request = double(host: 'api.rails_api_2.dev')
      api_constraints_v2.matches?(request).should be_true
    end
 
end
class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.rails_api_2.v#{@version}")
  end
end