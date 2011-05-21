require 'rubygems'
require 'sinatra'
require 'lib/selic'
require 'lib/util'
require 'googlecharts'

set :port, 80

get '/' do
	selic = Selic.new
	@info = ''
	@year =  Util.getCurrentYear
	@dados = selic.dados(@year)
	if (@dados[':M1'].nil?)
		@dados = selic.getEmpty
		@info = 'Não há dados disponíveis para o ano '.concat(@year)
	end
	erb :index
end

get '/:year' do
	selic = Selic.new
	@info = ''
	@year = params[:year]
	if Util.isNumeric(@year)
		@dados = selic.dados(@year)
		if (@dados[':M1']).nil?
			@dados = selic.getEmpty
			@info = 'Não há dados disponíveis para o ano '.concat(@year)
		end
	else
		@dados = selic.getEmpty
		@info = 'O ano informando não é válido: '.concat(@year)			
	end
	erb :index
end
