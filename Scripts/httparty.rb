require 'httparty'
require 'nokogiri'
require 'byebug'
require 'octokit'

def crawler
  urlsProject = Array.new
  urlsSonar = Array.new

  File.readlines("urls.csv").each do |line|
    urlsProject.push(line)
  end
  
  temp = urls[0].delete!("\n")
  umparsed = HTTParty.get(temp)
  parsed = Nokogiri::HTML(umparsed)
  readme = parsed.css('div#readme')

  links = readme.css('a')
  links.each do |link|
    urlsSonar.push(link.attr('href'))
    #puts link.attr('href')
  end
  
end

crawler

#lima e silva 1595 22



