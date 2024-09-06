echo "Compiling/packing and uploading addon... $1/$2"
addon_path = $1/$2
cd $addon_path
python $addon_path/create_package.py
