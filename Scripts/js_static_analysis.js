execSync = require('child_process').execSync;

target_folder = "/media/guilhermeddf/Files/Workspace/ci_analysis/Python/";
project_name = "sentry"
name_project = "sentry"

for (let i = 1; i <= 24; i++) {
    execSync(`cd ${target_folder}${project_name}/${i} && pylint ${name_project} --output-format=json > ${i}.json`)
    console.log("Testando") 
}


