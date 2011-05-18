class Util
	def self.calculaMedia(array, *args)
		media = 0.0
		array.each do | v |
			media= media + v.to_f
		end
		return media / array.length
	end

	def self.getCurrentYear()
		t = Time.now
		return t.strftime("%Y")
	end

end
