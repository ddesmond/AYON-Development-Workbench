WRKB_AYON_PATH=$1/addons/ayon-core
echo "Updating core create env"
cd $WRKB_AYON_PATH
./tools/manage.sh create-env

