gcloud projects add-iam-policy-binding sdc-project-445322 \
    --member="serviceAccount:362100615975-compute@developer.gserviceaccount.com" \
    --role="roles/compute.networkAdmin"

gcloud projects add-iam-policy-binding sdc-project-445322 \
    --member="serviceAccount:362100615975-compute@developer.gserviceaccount.com" \
    --role="roles/compute.loadBalancerAdmin"
