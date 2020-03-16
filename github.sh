#!/bin/bash


clear

mkdir gitrepo

cd gitrepo

git clone https://github.com/Fadia2016/CISC3140.git

cd CISC3140

echo "#include<iostream>

using namespace std;
int main()
{


	cout << "Hello World!"<< endl;



	return 0;

}" > code.cpp


echo "output: hello.o
	g++ hello.o -o output

hello.o: hello.cpp
	g++ -c hello.cpp


clean:
	rm *.o output" > makefile









