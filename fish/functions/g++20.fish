function g++20
    set name (string replace -r '\.cpp$' '.out' $argv[1])
    g++ $argv[1] -o $name -std=c++20 -O2 -fsanitize=address -Wall -Wextra -Wshadow -I/Users/ivokaragyozov/Documents/cp/coding-library
end
