#include <stdio.h>

int main() {
    char Operator;
    float num1, num2, result = 0;
    printf("Enter any one operator like +, -, *, / : ");
    scanf("%c", &Operator);
    printf("Enter the values of Operands num1 and num2  : ");
    scanf("%f%f", &num1, &num2);
    switch (Operator) {
        case '+':
            result = num1 + num2;
            break;
        case '-':
            result = num1 - num2;
            break;
        case '*':
            result = num1 * num2;
            break;
        case '/':
            if (num2 != 0) {
                result = num1 / num2;
            } else {
                printf("Error: Division by zero is not allowed.\n");
                return 1;
            }
            break;
        default:
            printf("Invalid Operator ");
    }
    printf("The value = %f", result);
    return 0;
}