 
find . -type f -exec grep -l "localhost:8000" {} \; | xargs sed -i 's/localhost:8000/localhost:8080/g'
