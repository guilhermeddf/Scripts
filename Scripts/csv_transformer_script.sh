echo "Digite o nome do projeto: "
read project_name

mkdir "/media/guilhermeddf/Files/Workspace/ci_analysis/Python/$project_name/CSV/"

directory_input="/media/guilhermeddf/Files/Workspace/ci_analysis/Python/$project_name/JSON/"
directory_output="/media/guilhermeddf/Files/Workspace/ci_analysis/Python/$project_name/CSV/"

echo "Fazendo o parser do projeto $project_name."

for i in {1..24}; 
do
	echo "Versão $i do projeto $project_name."
	json2csv -i "$directory_input$i.json" -o "$directory_output$i.csv"
done

echo "----- Concluido -----"
