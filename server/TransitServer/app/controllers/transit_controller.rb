require 'open-uri'

class TransitController < ApplicationController

	TEST_PARAMS = {
		"eki1" => "%E6%9D%B1%E4%BA%AC",
		"eki2" => "%E5%85%AD%E6%9C%AC%E6%9C%A8",
		"eki3" => "",
		"via_on" => "1",
		"Dym" => "201410",
		"Ddd" => "14",
		"Dhh" => "17",
		"Dmn1" => "5",
		"Dmn2" => "3",
		"Cway" => "0",
		"Cfp" => "1",
		"C7" => "1",
		"C2" => "0",
		"C3" => "0",
		"C1" => "0",
		"C4" => "0",
		"C6" => "2",
		"S.x" => "42",
		"S.y" => "12",
		"S" => "%E6%A4%9C%E7%B4%A2",
		"Cmap1" => "",
		"rf" => "nr",
		"pg" => "0",
		"eok1" => "",
		"eok2" => "",
		"eok3" => "",
		"Csg" => "1"		
	}

	def index
		personal = Nokogiri::HTML(open "http://www.jorudan.co.jp/norikae/cgi/nori.cgi?" + generateParam(TEST_PARAMS))
    	render :json => personal
	end

private 
	
	def generateParam(hash)
	
		pms = []
		hash.each do |key, value| 
			pms << "#{key}=#{value}"
		end
		pms.join("&")

	end

end
