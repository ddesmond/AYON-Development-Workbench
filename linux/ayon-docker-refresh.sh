WRKB_AYON_PATH=$1
cd $WRKB_AYON_PATH/ayon-docker
ls $WRKB_AYON_PATH/ayon-docker

docker pull ynput/ayon:latest #replace with corresponding image version if you don't want latest
docker compose up -d --build
