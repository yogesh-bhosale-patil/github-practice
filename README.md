# github-practice
github-practice

export GH_USERNAME='yogesh-bhosale-patil'
export GH_TOKEN= ''
export GH_IMAGE_NAME='hello-world'
export GH_VER='1.0.0'

# Login to GitHub Container Registry
echo $GH_TOKEN | docker login ghcr.io -u $GH_USERNAME --password-stdin

# Tag the image correctly
docker tag hello-world:latest ghcr.io/$GH_USERNAME/$GH_IMAGE_NAME:$GH_VER

# Push the image
docker push ghcr.io/$GH_USERNAME/$GH_IMAGE_NAME:$GH_VER
