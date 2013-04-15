require 'nokogiri'
require 'net/http'
require 'uri'


DOWNLOAD_LOCATION = "#{Dir.pwd}/Downloads"
END_POINT_URL = "http://www.cs.sunysb.edu/~algorith/video-lectures/"
XPATH = "//div[(((count(preceding-sibling::*) + 1) = 3) and parent::*)]//td[(((count(preceding-sibling::*) + 1) = 3) and parent::*)]//a"

module ScrapeTool
	class << self
		def open(url)
		  Net::HTTP.get(URI.parse(url))
		end

		def scrape_remote_website
			doc = Nokogiri::HTML(open("#{END_POINT_URL}"))

			doc.xpath("#{XPATH}").map do |o|
				ScrapeTool::download_binary_file o.attributes["href"].value rescue nil
			end
		end

		def download_binary_file(remote_file)
			Dir.mkdir("#{DOWNLOAD_LOCATION}") unless File.exists?("#{DOWNLOAD_LOCATION}")
			local_file = File.open("#{DOWNLOAD_LOCATION}/#{remote_file.gsub("/", "-")}", "w")
			puts "Downloading: #{remote_file}"

			begin
			  local_file.write(open("#{END_POINT_URL}#{remote_file}")) 
			ensure
		   	  local_file.close()
			end
		end
	end

end	

ScrapeTool::scrape_remote_website
