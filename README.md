This is a simple scrapping tool written in Ruby. 

I usually use this when I have to download multiple files from a website, like videos, slides etc. 

To make this work for you;
- Open the project
- Edit scrape_website.rb file & 
	- Change the ```END_POINT_URL```variable to point it to the website you wish to scrape
	- Deduce the ```XPATH```of the element you wish to download. You could use http://www.selectorgadget.com/ to easily find XPATH
	- Optionally, you could change the ```DOWNLOAD_LOCATION```. By default it would create a new folder called "Downloads" and scrape all files there
- Enjoy & Contribute
