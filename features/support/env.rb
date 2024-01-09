require 'cucumber'
require 'httparty'
require 'rspec'
require 'faker'
require 'cpf_cnpj'
require 'cpf_generator'
require 'json'
require 'json-schema'
require 'parallel_tests'
require 'require_all'
require 'byebug'
require 'pry'

require_relative 'helper_requests'
require_relative 'utils'

World(HelperRequests)

ENVIRONMENT_TYPE ||= ENV['ENVIRONMENT_TYPE']

YAML_CONFIG ||= YAML.load_file("cucumber.yml")
env_default = YAML_CONFIG["ambiente_padrao"]

case ENVIRONMENT_TYPE
  when "hml"
    CONFIG ||= YAML.load_file("./features/config/hml.yml")
  when "prd"
    CONFIG ||= YAML.load_file("./features/config/prd.yml")
  when nil
    CONFIG ||= YAML.load_file("./features/config/#{env_default}.yml")
  else
    raise "Invalid Parameter!!! -> #{ENVIRONMENT_TYPE}"
end