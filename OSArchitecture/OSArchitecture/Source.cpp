#include <iostream>
#include "ZeroAndOverflow.h"

using namespace std;

extern "C"
{
	int checkOfZeroAndOverflowASM(int a, int b);
}

int main()
{
	int a, b;
	cout << "Please, enter divisible: ";
	cin >> a;
	cout << "Please, enter divider: ";
	cin >> b;
	cout << checkOfZeroAndOverflowCPP(a, b) << '\n';
	cout << "Result:" << checkOfZeroAndOverflowASM(a, b);

	return 0;
}
