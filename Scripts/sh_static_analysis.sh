echo "Digite o nome do projeto: "
read project_name

echo "Digite o nome do Modulo: "
read project_module

full_directory="/media/guilhermeddf/Files/Workspace/ci_analysis/Python/$project_name/"
directory_complement="/lib/$project_module"

directory_saving="/media/guilhermeddf/Files/Workspace/ci_analysis/Python/$project_name/JSON/"

echo "Começando a analisar o projeto $project_name"

for i in {1..24}; 
do
	echo "Analisando a versão $i do projeto $project_name."
	cd "$full_directory$i" && pylint $i "--output-format=json" > "$directory_saving$i.json"
done

echo "----- Concluido -----"
