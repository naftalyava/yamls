# Get your GCP project ID
export PROJECT_ID=$(gcloud config get-value project)

# Create service account
gcloud iam service-accounts create k8s-ccm \
    --description="Cloud Controller Manager" \
    --display-name="k8s-ccm"

# Grant required IAM roles
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.loadBalancerAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.networkViewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.instanceAdmin.v1"

# Create a JSON key
gcloud iam service-accounts keys create k8s-ccm-key.json \
    --iam-account=k8s-ccm@$PROJECT_ID.iam.gserviceaccount.com

# Create Kubernetes secret for CCM
kubectl create secret generic cloud-controller-manager \
    -n kube-system \
    --from-file=cloud-config=k8s-ccm-key.json