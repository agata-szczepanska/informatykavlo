#include <iostream>
#include <cmath>
#include <fstream>

using namespace std;

bool czy_pierwsza(int b)
{
    if (b < 2) return false;
    for (int i = 2; i <= sqrt(b); i++)
    {
        if (b % i == 0)
            return false;
    }
    return true;
}

int main()
{
    ofstream file("wyniki.txt");

    if (!file.is_open()) {
        cerr << "Nie można otworzyć pliku wyniki.txt" << endl;
        return 1;
    }

    int n, a = 1, b = 1;

    for (int i = 0; i < 40; i++)
    {
        int temp = a;
        a = b;
        b = temp + a;

        if (czy_pierwsza(b)) {
            file << b << endl;
        }
    }

    file.close();

    return 0;
}
