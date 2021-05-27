#include "helper.h"

Helper::Helper(QObject *parent) : QObject(parent)
{

}
int Helper:: randboxvalue(){

    int boxvalue= rand()%6+1;
    return boxvalue;
}
int Helper:: randmaxvalue(){
    int maxvalue = (rand()%3+1)*100+rand()%99+1;
    return maxvalue;
}
