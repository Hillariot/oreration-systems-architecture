#include <iostream>
#include <string>
#include "ZeroAndOverflowCPP.h"

using namespace std;




string checkOfZeroAndOverflowCPP(int a, int c,int d)
{
	if (a/4-1 == 0)
		return "Sorry, but you entered zero as divider, that's incredible";

	return "Result: " + to_string(int((2*c-d+23)/(int(a/4)-1))) + " without division by zero";
}


