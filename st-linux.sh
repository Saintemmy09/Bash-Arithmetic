#!/bin/bash

echo "Welcome to my mini Arithmetic Calculator"

read -p "Enter your name: " name
read -p "Welcome $name, Please enter the arithmetic operation you would love to perform (e.g., 2+3): " operation

regex="([+-/*])"   
           
let answer                 

perform_operation() {                   
    if [[ $operation =~ $regex ]]; then
        operand="${BASH_REMATCH[1]}" 
        operator=($(echo $operation | tr "$operand" "\n"))

        num1=${operator[0]} 
        num2=${operator[1]}

        case "$operand" in
            "+")
                answer=$(($num1 + $num2))
                echo "The result of $num1 + $num2 is: $answer"
                ;;
            "-")
                answer=$(($num1 - $num2))
                echo "The result of $num1 - $num2 is: $answer"
                ;;
            "*")
                answer=$(($num1 * $num2))
                echo "The result of $num1 * $num2 is: $answer"
                ;;
            "/")
                if [[ $num2 -eq 0 ]]; then
                    echo "Error: Division by zero is not allowed."
                else
                    answer=$(($num1 / $num2))
                    echo "The result of $num1 / $num2 is: $answer"
                fi
                ;;
            *)
                echo "Invalid operator. Please try again."
                return 1
                ;;
        esac  
    else
        echo "Invalid input. Please enter a valid arithmetic operation (e.g., 1+5)."
        return 1
    fi
}

perform_operation
