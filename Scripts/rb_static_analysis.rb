target_folder = "/media/guilhermeddf/Files/Workspace/ci_analysis/Python/";
project_name = "sentry"
name_project = "sentry"

(1..24).each do |i|
    begin
        exec("cd #{target_folder}#{project_name}/#{i} && 
        pylint #{name_project} --output-format=json > #{target_folder}#{project_name}/JSON/#{i}.json && true")
    rescue
        puts "Caiu aqui"
    end
end
