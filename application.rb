require 'rubygems'
require 'sinatra'
require 'lib/selic'
require 'googlecharts'

set :port, 80

get '/' do
	selic = Selic.new
	@dados = selic.dados
	@ano = selic.ano
	erb :index
end
