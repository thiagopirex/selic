require 'rubygems'
require 'sinatra'
require 'lib/selic'
require 'lib/util'
require 'googlecharts'

set :port, 80

get '/' do
	selic = Selic.new
	@year =  Util.getCurrentYear
	@dados = selic.dados(@year)
	erb :index
end

get '/:year' do
	selic = Selic.new
	@year = params[:year]
	@dados = selic.dados(@year)
	erb :index
end
