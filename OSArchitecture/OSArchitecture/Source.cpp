#include <iostream>
#include "ZeroAndOverflowCPP.h"

using namespace std;



extern "C"	int _stdcall checkOfZeroAndOverflowASM(int a, int b);
extern "C" unsigned char error;


int main()
{
	int a, b, result;
	cout << "Please, enter divisible: ";
	cin >> a;
	cout << "Please, enter divider: ";
	cin >> b;
	cout << checkOfZeroAndOverflowCPP(a, b) << '\n';
	result=checkOfZeroAndOverflowASM(a, b);
	if (error == 1)
		cout << "Error: division by zero\n";
	else if (error == 2)
		cout << "Error: overflow\n";
	else
		cout << "Result: " << result << "\n";

	return 0;
}
