import pandas as pd

input_folder = '/media/guilhermeddf/Files/Workspace/ci_analysis/Python/CSV/CSV_TUDO/'
file_name = raw_input("Digite o nome do arquivo: ")

input_csv = pd.read_csv(input_folder + file_name + ".csv")

totals = input_csv.groupby('version')
totals2 = totals['type'].value_counts().to_frame('totals')

#totals = input_csv['version'].value_counts().to_frame('totals')

totals2.index.names = ['version', 'type']
result = totals2.reset_index()

result.to_csv(input_folder + "Totals/" + file_name + "_PER_TYPE.csv")


# ERPNEXT_CSV, INCUBATOR_CSV, IPYTHON_CSV,
# KERAS_CSV, KIVY_CSV, PYRAMID_CSV, SALT_CSV,
# SCIKIT_I_CSV
# SCIKIT_L_CSV, SENTRY_CSV, SPINNAKER_CSV
