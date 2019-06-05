
# ERPNEXT_CSV, INCUBATOR_CSV, IPYTHON_CSV, 
# KERAS_CSV, KIVY_CSV, PYRAMID_CSV, SALT_CSV, 
# SCIKIT_I_CSV
# SCIKIT_L_CSV, SENTRY_CSV, SPINNAKER_CSV

import pandas as pd

input_folder = '/media/guilhermeddf/Files/Workspace/ci_analysis/Python/CSV/'

project_folder = raw_input("Digite o nome do projeto: ")

for i in range(4, 7, 1):
    csv_input = pd.read_csv(input_folder + project_folder + "/" + str(i) + ".csv")
    csv_input['version'] = i
    csv_input.to_csv(input_folder + project_folder + "/CSV/"  + str(i) + ".csv", index=False)
