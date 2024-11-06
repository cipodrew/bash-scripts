# Define the function
greet() {
    echo "Hello, $1"
}

# Call the function
greet "World"
echo $1
