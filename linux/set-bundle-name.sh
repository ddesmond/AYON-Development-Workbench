rm -r .bundle
echo "Set Bundle name"
echo "Enter the server url including the port and protocol (http/https)"
echo "Example: dev-latest-1.0.4"
echo "------------------------------"
read -p "Enter bundle name: " BUNDLE_NAME
touch .bundle
echo SET_AYON_BUNDLE=$BUNDLE_NAME >> .env
echo "Bundle variabl set"
cat .bundle
