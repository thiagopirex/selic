require 'open-uri'
require 'nokogiri'


class Selic
	
	def getXml
		#ip = "http://172.16.1.37:8080"
		#url = ip.concat(getURL(year))
		#@doc= Nokogiri::XML(open(url))
		self
	end

	def getDefaultFile
		url = "/file_teste.xml"
		@doc = Nokogiri::XML(File.open(File.dirname(__FILE__).concat(url)))
		self
	end
	
	def content
		@doc.content
	end

	def getObjects
		#getXml
		getDefaultFile
		return @doc.xpath('//valores').xpath('o')
	end


	def dados(year)
		@year = year
		#Armazena temporariamente os valores diários de determinado mês para calculo da média mensal
		valores_do_mes = Array.new

		#Variáveis de controle
		#ano_compare = year.to_s
		@ano_compare = '2008'
		mes_compare = ''

		
		resultado_mes = {}
		
		resultado_ano = {}


		#iteração por objeto presente no xml
		getObjects.each do |obj|
			ano   = obj.xpath('ano').inner_text

			if @ano_compare.eql? ano
				mes   = obj.xpath('mes').inner_text
				if mes_compare.eql? mes
					valor = obj.xpath('valor').inner_text
					valores_do_mes.push(valor)
				else	

					if valores_do_mes.empty?
						valor = obj.xpath('valor').inner_text
						valores_do_mes.push(valor)					
					else
						#realiza calculo da média
						pos_array = ':M'.concat(mes_compare)						

						resultado_mes[pos_array] = Util.calculaMedia(valores_do_mes)
						valores_do_mes.clear
						valor = obj.xpath('valor').inner_text
						valores_do_mes.push(valor)
					end
					mes_compare = mes											
				end
			end
			
		end

		#cálculo da média do último mês lido do XML
		pos_array = ':M'.concat(mes_compare)
		resultado_mes[pos_array] = Util.calculaMedia(valores_do_mes)
		
		@dados = resultado_mes
	end

	def getURL(year)
		url = 'series-bcb/serie/valores/xml/432'
		dataInicio = '0101'
		dataFinal = '3112'
		pipe = '%7C'
		return 	url.concat(pipe).concat(dataInicio).concat(year).concat(pipe).concat(dataFinal).concat(year)
	end
	
end
