#include <iostream>
#include "ZeroAndOverflowCPP.h"

using namespace std;



extern "C"	int _stdcall checkOfZeroAndOverflowASM(int a, int c, int d);
extern "C" unsigned char error;


int main()
{
	int a, c,d, result;
	cout << "Please, enter a: ";
	cin >> a;
	cout << "Please, enter c: ";
	cin >> c;
	cout << "Please, enter d: ";
	cin >> d;
	cout << checkOfZeroAndOverflowCPP(a, c,d) << '\n';
	result=checkOfZeroAndOverflowASM(a, c, d);
	if (error == 1)
		cout << "Error: division by zero\n";
	else if (error == 2)
		cout << "Error: overflow\n";
	else
		cout << "Result: " << result << "\n";

	return 0;
}
