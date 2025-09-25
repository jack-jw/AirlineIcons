#!/bin/zsh

cd $(dirname $0)/svg

echo [
num=1
for file in *; do
    filename=$(basename "$file")
    
    if [[ "$filename" =~ ^.*\.svg$ ]]; then
        filename=$(echo "$filename" | sed 's/.svg$//g')
        filename=$(echo "$filename" | sed 's/ZMIL_//g')
        echo "    \"$filename\": $num,"
        ((num++))
    fi
done
echo ]