#include <iostream>
#include <string>
#include "ZeroAndOverflow.h"

using namespace std;




string checkOfZeroAndOverflowCPP(int a, int b)
{
	if (b == 0)
		return "Sorry, but you entered zero as divider, that's incredible";

	return "Result: " + to_string(a / b) + " without division by zero";
}


