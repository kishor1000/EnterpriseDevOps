#include<iostream>
#include "calculator.h"

using namespace std;

int main()
{

Calculator calc;

cout<<"=============================="<<endl;

cout<<" Enterprise DevOps CI/CD Calculator"<<endl;

cout<<"=============================="<<endl;

cout<<"Addition       : "<<calc.add(100,25)<<endl;

cout<<"Subtraction    : "<<calc.subtract(100,25)<<endl;

cout<<"Multiplication : "<<calc.multiply(100,25)<<endl;

cout<<"Division       : "<<calc.divide(100,25)<<endl;

return 0;

};
