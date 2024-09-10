WRKB_AYON_PATH=$1
cd $WRKB_AYON_PATH/ayon-docker
ls $WRKB_AYON_PATH/ayon-docker

docker compose up -d
make setup