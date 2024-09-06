WRKB_AYON_PATH=$1
cd $WRKB_AYON_PATH/ayon-launcher
ls $WRKB_AYON_PATH/ayon-launcher
./tools/make.sh create-env
echo "install runtimes"
./tools/make.sh install-runtime-dependencies
./tools/make.sh build