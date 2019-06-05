require 'octokit'
require 'csv'

class ContributorsMiner
  	$AccessToken = 'ab6d9b2786be0bdd4bc93ee7f8fefd47701940b2'
	$Organization = 'ucloud'
	$Repository = 'ucloud-sdk-go'
	
	def getAllContributors
		contributorsList = Array.new
		githubPath = "#{$Organization}/#{$Repository}"
		
		puts "Recuperando informacoes do projeto #{$GithubPath}."
		
		client = Octokit::Client.new(:access_token => $AccessToken)
  		client.auto_paginate = true
		commitsList = client.commits(githubPath)
		
		commitsList.each do |commit|	
			contributorsList.push(commit[:commit][:author])
			puts contributorsList.to_s
		end
	
  		puts 'Salvando as informacoes em um arquivo CSV.'
  		CSV.open("Data/#{$Repository}.csv", 'w') do |csv|
    		contributorsList.each { |ar| csv << ar }
		end
  		puts 'Concluido.'
	end
  
end

repository = ContributorsMiner.new
repository.getAllContributors
