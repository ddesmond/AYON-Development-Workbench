WRKB_AYON_PATH=$1
SET_AYON_BUNDLE=$2
DOCKER_VARIANT=$3

# set QT binding
export QT_BINDING=pyside2

cd $WRKB_AYON_PATH/ayon-dependencies-tool
ls $WRKB_AYON_PATH/ayon-dependencies-tool
./start.sh docker-create -b $SET_AYON_BUNDLE -v $DOCKER_VARIANT




