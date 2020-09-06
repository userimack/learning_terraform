#!/usr/bin/bash -e

BASE_DIR="/Users/mahendra/learning_projects/learning_terraform/book_examples"
AUTO_APPROVE=$1||false

echo ${AUTO_APPROVE}

# cd ${BASE_DIR}

find ${BASE_DIR} -name ".terraform" -type d | grep -v "workspace_example" | while read -r  DIR;
do
echo ${DIR};
# cd ${DIR};

terraform destroy -auto-approve -state=${DIR/".terraform"/"terraform.tfstate"}
# if [[ ${AUTO_APPROVE} == true ]];
# then
#     # else
#     # terraform destroy -state=${DIR/".terraform"/"terraform.tfstate"}
# fi;
# cd ${BASE_DIR}
done
