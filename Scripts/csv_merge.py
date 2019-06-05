import pandas as pd
import glob

input_folder = '/media/guilhermeddf/Files/Workspace/ci_analysis/Python/CSV/'

project_name = raw_input("Digite o nome do projeto: ")

all_files = glob.glob(input_folder + project_name + "/CSV/" + "*.csv")

li = []

for filename in all_files:
    df = pd.read_csv(filename, index_col=None, header=0)
    li.append(df)

frame = pd.concat(li, axis=0, ignore_index=True)

frame.to_csv(input_folder + project_name + "/CSV/" + project_name +".csv")
