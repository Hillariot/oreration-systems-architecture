#include <iostream>
#include <string>
#include "ZeroAndOverflowCPP.h"

using namespace std;




string checkOfZeroAndOverflowCPP(int a, int b)
{
	if (b == 0)
		return "Sorry, but you entered zero as divider, that's incredible";
	if (a==INT32_MIN and b== -1)
		return "Sorry, but entered numbers that's call entered";

	return "Result: " + to_string(a / b) + " without division by zero";
}


