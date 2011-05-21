require 'rubygems'
require 'rspec'
require 'selic'


describe Selic do

	let(:selic) { Selic.new }

	#describe 'getXml' do
	
	#	let(:xml) { selic.getXml }

	#	it 'should open xml with text "Taxa de juros - Meta Selic definida pelo Copom"' do
	#		xml.should be
	#		xml.content.should match /Taxa de juros - Meta Selic definida pelo Copom/
	#	end
	#end

	describe 'getObjects' do
		let(:objetos) { selic.getObjects }
		it 'should objetos not null' do
			objetos.should be
			objetos.should_not be_nil
		end
	end


	describe 'gerarUrl' do
		let(:url) { selic.getURL('2008')}
		it 'should generate url to year 2008' do
			selic.getURL('2008').should == 'series-bcb/serie/valores/xml/432%7C01012008%7C31122008'
		end
	end

	describe 'getDefaultFile' do
		let(:xml) { selic.getDefaultFile }
		it 'should math year 2008' do
			xml.should be
			xml.content.should match /2008/
		end
	end
  
end
