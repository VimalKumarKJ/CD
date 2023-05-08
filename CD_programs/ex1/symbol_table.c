#include <stdio.h>
#include <string.h>

int main(){
    FILE *f;
    char line[200];
    const char *data_types[] = {"int", "float", "double", "char"};
    f = fopen("text.c", "r");
    if(!f){
        printf("Could not open the file!");
        return 1;
    }

    printf("Ident\t| Type\t| Address\n");
    printf("------------------------\n");

    while(fgets(line, sizeof(line), f)){
        char *token = strtok(line, " ,;\n");
        if(token && strcmp(token , "typedef") != 0 && strcmp(token, "struct") != 0){
            const char *type = NULL;
            for(int i = 0; i < sizeof(data_types)/sizeof(data_types[0]); i++){
                if(strcmp(data_types[i], token) == 0){
                    type = data_types[i];
                    break;
                }
            }
            if(type){
                while((token = strtok(NULL, " ,;\n"))){
                    printf("%s\t| %s\t| %p\n", token, type, *(void**)&token);
                }
            }
        }
    }
    fclose(f);
    return 0;
}
    
    

