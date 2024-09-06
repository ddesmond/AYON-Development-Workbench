WRKB_AYON_PATH=$1
SET_AYON_BUNDLE=$2
cd $WRKB_AYON_PATH/ayon-dependencies-tool
ls $WRKB_AYON_PATH/ayon-dependencies-tool
./start.sh create -b $SET_AYON_BUNDLE

