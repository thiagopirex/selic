require 'rubygems'
require 'rspec'
require 'util'

describe Util do

	describe 'calculaMedia' do
		let(:collection) { Array.new(['2','4','6','8'])}
		it 'should calculate media and puts result = 5' do
			Util.calculaMedia(collection).should == 5.0
		end
	end

	describe 'getCurrentYear' do
		let(:year) { util.getCurrentYear }
		it 'should get year 2011' do
			Util.getCurrentYear.should == '2011'
		end
	end

end
