#include <stdio.h>
#include <string.h>

int main() {
    FILE *f;
    char line[100][200];
    const char *data_types[] = {"int", "float", "double", "char", "void"};
    char non_identifiers[] = {'{', '}', '[', ']', ':'};

    f = fopen("test.c", "r");
    if (!f) {
        printf("Could not open file.\n");
        return 1;
    }

    printf("line\t| pre-processor\t |Keyword\t |function\t |Identifier\n");
    printf("-----------------------------------------------------\n");

    int line_num = 1;
    while (fgets(line[line_num-1], 200, f)) {
        char *token = strtok(line[line_num-1], " ,;\n");
        char pre_processor[30] = "", keyword[30] = "", function[30] = "", identifier[10] = "";
        while (token != NULL) {
            char *check = strchr(token, '#');
            if (check != NULL) {
                strcpy(pre_processor, token);
            } else {
                int is_data_type = 0;
                for (int i = 0; i < sizeof(data_types)/sizeof(data_types[0]); i++) {
                    if (strcmp(data_types[i], token) == 0) {
                        strcpy(keyword, token);
                        is_data_type = 1;
                        break;
                    }
                }
                if (!is_data_type) {
                    char *check_func = strchr(token, '(');
                    if (check_func != NULL) {
                        strcpy(function, token);
                    } else {
                        int is_non_identifier = 0;
                        for (int i = 0; i < sizeof(non_identifiers)/sizeof(non_identifiers[0]); i++) {
                            if (strchr(token, non_identifiers[i]) != NULL) {
                                is_non_identifier = 1;
                                break;
                            }
                        }
                        if (!is_non_identifier) {
                            strcpy(identifier, token);
                        }
                    }
                }
            }
            token = strtok(NULL, " ,;\n");
        }
        printf("%d\t |%s\t |%s\t |%s\t |%s\n", line_num, pre_processor, keyword, function, identifier);
        line_num++;
    }
    fclose(f);
    return 0;
}
