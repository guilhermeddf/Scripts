require 'octokit'
require 'csv'
require 'byebug'

class SearchMiner
    $AccessToken = '5c06ff491bb1f28669644dfefa799db7ac42a3d8'
    $SearchTerm = 'https://sonarcloud.io/dashboard'
    $Client = Octokit::Client.new(:access_token => $AccessToken)
    def getAllSearches
        repositoryList = Array.new
        itemsList = Array.new
		puts "Recuperando as buscas pelo termo #{$SearchTerm}."
		
		$Client = Octokit::Client.new(:access_token => $AccessToken)
        $Client.auto_paginate = true
        searchList = $Client.search_code($SearchTerm, :per_page => 100)
        itemsList = searchList[:items]

        itemsList.each do |item|
           repositoryList.push(item[:repository])
        end
          
        puts 'Salvando as informacoes das buscas em um arquivo CSV.'
  	    CSV.open("Data/Busca/search.csv", 'w') do |csv|
    		itemsList.each { |ar| csv << ar }
	    end
  		puts 'Concluido.'
    
    end

    def getNumberOfContributors
        fullNameProject = Array.new

        File.readlines("full_name.csv").each do |line|
            line.delete!("\n")
            fullNameProject.push(line)
        end
        
        $Client.auto_paginate = true
        arq = File.new("arquivo.csv", "w")
        controle = 1
        fullNameProject.each do |fullName|
            contributorsList = $Client.contributors(fullName)
            cont = contributorsList.count
            arq.puts "#{fullName}, #{cont}"
            puts controle
            controle = controle + 1

        end
        arq.close
        puts "terminou!"
    end
end

search = SearchMiner.new
#search.getAllSearches
search.getNumberOfContributors