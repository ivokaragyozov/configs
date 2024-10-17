function g++20 --wraps='g++ -std=c++20 -o _compiled' --wraps='g++ -std=c++20 -o $argv%' --wraps=g++\ -std=c++20\ -o\ \(string\ replace\ -r\ \'\\.cpp\'\ \'\'\ \) --description alias\ g++20=g++\ -std=c++20\ -o\ \(string\ replace\ -r\ \'\\.cpp\'\ \'\'\ \)
  g++ -std=c++20 -o (string replace -r '\.cpp' '' ) $argv
        
end
