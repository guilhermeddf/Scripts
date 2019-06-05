require 'octokit'
require 'json'
require 'csv'
=begin
  

class GetAllIssues
  issues = File.new('Teste.txt', 'w')
  client = Octokit::Client.new(:access_token => 'a968ca91706d84b30eede54aef6712cb95797a0c')
  issues.write(client.list_issues('scipy/scipy', :per_page => 100))
  issues.close unless issues.closed?
end

class TentandoPaginar
  issues = File.new('Correto.txt', 'w')
  client = Octokit::Client.new(:access_token => 'de082b04c3e359cd436ec4e36f372042e7bac107')
  client.auto_paginate = true
  issues.write(client.list_issues('scipy/scipy', :per_page =>100))
  issues.close unless issues.closed?
  puts 'Deu certo'
end

class TryingToGetClosedIssues
  client = Octokit::Client.new(:access_token => 'd8ac6cc4f87e696b36f0faaf65ea3a09f7f2aff0')
  client.auto_paginate = true
  issues = client.list_issues('scipy/scipy', :state => 'all')

  CSV.open('all_issues.csv', 'w') do |csv|
    issues.each { |ar| csv << ar }
  end
  puts 'Terminou! <3'
end

class ParseTxtToJson
  arquivo = File.open("Correto.txt", 'r')
  string =  arquivo.readlines("Correto.txt")[0]
  json = JSON.generate(string)
  arq = File.new('Corret.json', 'w')
  arq.write(json)
end

class ParseJsonToCsv
  CSV.open("Scipy-0.14.0.csv", "w") do |csv|
    JSON.parse(File.open("pylint_global.json").read).each do |hash|
      csv << hash.values
    end
  end
  puts 'Transformou!'
end

class GetReleases
  client = Octokit::Client.new(:access_token => '26c6296b3a731984e5091872043012ae25e5f2f7')
  client.auto_paginate=true
  releaseList = client.releases('scipy/scipy')

  CSV.open('all_releases.csv', 'w') do |csv|
    releaseList.each { |ar| csv << ar }
  end
  puts 'Terminou!'
end

class GetOneRelease
  client = Octokit::Client.new(:access_token => '26c6296b3a731984e5091872043012ae25e5f2f7')
  client.auto_paginate=true
  release = client.release('repos/scipy/scipy/releases/4167072')

  CSV.open('release-0.18.1.csv', 'w') do |csv|
    release.each { |ar| csv << ar }
  end
  puts 'Terminou!'
end


class GetPullRequests
  client = Octokit::Client.new(:access_token => '26c6296b3a731984e5091872043012ae25e5f2f7')
  client.auto_paginate=true
  pullList = client.pull_requests('scipy/scipy', :state => 'closed')

  CSV.open('all_pullrequests.csv', 'w') do |csv|
    pullList.each { |ar| csv << ar }
  end
  puts 'Terminou!'
end

GetPullRequests


class GetReleases
  client = Octokit::Client.new(:access_token => '26c6296b3a731984e5091872043012ae25e5f2f7')
  client.auto_paginate=true
  releaseList = client.releases('scipy/scipy')

  CSV.open('all_releases_2.csv', 'w') do |csv|
    releaseList.each { |ar| csv << ar }
  end
  puts 'Terminou!'
end

GetReleases


class GetAllComments
  client = Octokit::Client.new(:access_token => '26c6296b3a731984e5091872043012ae25e5f2f7')
  client.auto_paginate=true
  commentsList = client.pull_requests_comments('scipy/scipy')
  
  CSV.open('all_pull_requests_comments.csv', 'w') do |csv|
    commentsList.each { |ar| csv << ar }
  end
  puts 'Terminou!'
end

GetAllComments


class ParseJsonToCsv
  CSV.open("pull_releases.csv", "w") do |csv|
    JSON.parse(File.open("pull_requests_information_rl_scipy.json").read).each do |hash|
      csv << hash.values
    end
  end
  puts 'Transformou!'
end

ParseJsonToCsv


class GetClosed
  re = /#[0-9]* |gh-[0-9]*/m
  
  CSV.foreach('all.csv') do |row|
    row.scan(re) do |match|
      puts match.to_s
    end
  end
end
GetClosed
=end

class GetClosed
  re = (/Fixes #[0-9]* |fixes #[0-9]* |Closes #[0-9]* |closes #[0-9]*/)
  #str = CSV.read('all.csv')
  #str = "356546 #4645 gh-4656 sfghfh 345345"
  CSV.foreach('all.csv') do |row|
   row[1].scan(re) do |match|
    puts row[0] + "," +match.to_s
   end
  end
end

GetClosed
