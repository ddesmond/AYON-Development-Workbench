rm -r .env
echo "Set environment variables for the server URI and API key"
echo "Enter the server url including the port and protocol (http/https)"
echo "Example: http://localhost:5000"
echo "Example: http://ayon.my-dearest-server.net"
read -p "Enter server url: " AYON_SERVER_URL
echo "Enter the server API key"
echo "You can find this key in the studio setup - api keys"
read -p "Enter server api key: " AYON_SERVER_APIKEY
touch .env
echo AYON_SERVER_URL=$AYON_SERVER_URL >> .env
echo AYON_API_KEY=$AYON_SERVER_APIKEY >> .env
echo "Environment variables set"
cat .env
