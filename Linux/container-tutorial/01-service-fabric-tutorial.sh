cd Linux/container-tutorial/azure-vote/

docker build -t azure-vote-front .

az login

  
ACR_NAME=acrlsmdev001
RES_GROUP=rsg-$ACR_NAME

#az account set --subscription <subscription_id>

az group create --name $RES_GROUP --location westus

az acr create --resource-group $RES_GROUP --name $ACR_NAME --sku Basic --admin-enabled true

az acr login --name $ACR_NAME

az acr show --name $ACR_NAME --query loginServer --output table

docker tag azure-vote-front $ACR_NAME.azurecr.io/azure-vote-front:v1

docker push $ACR_NAME.azurecr.io/azure-vote-front:v1

az acr repository list --name $ACR_NAME --output table