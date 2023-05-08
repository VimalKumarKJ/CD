#include <stdio.h>

#define MAX_SIZE 100

int stack[MAX_SIZE];
int top = -1;

void push(int item) {
    if (top == MAX_SIZE - 1) {
        printf("Error: stack overflow\n");
        return;
    }
    top++;
    stack[top] = item;
}

int pop() {
    int item;
    if (top == -1) {
        printf("Error: stack underflow\n");
        return -1;
    }
    item = stack[top];
    top--;
    return item;
}

int peek() {
    if (top == -1) {
        printf("Error: stack underflow\n");
        return -1;
    }
    return stack[top];
}

int is_empty() {
    if (top == -1) {
        return 1;
    }
    return 0;
}

int main() {
    push(1);
    push(2);
    push(3);
    printf("Top of stack: %d\n", peek());
    printf("Stack contents: ");
    while (!is_empty()) {
        printf("%d ", pop());
    }
    printf("\n");
    return 0;
}
