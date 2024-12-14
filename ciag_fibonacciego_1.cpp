#include <iostream>
#include <fstream> 
using namespace std;

int main()
{
    ofstream file("wyniki.txt");


    if (!file.is_open()) {
        cerr << "Nie można otworzyć pliku wyniki.txt" << endl;
        return 1; 
    }

    int n, a = 1, b = 1;

    for (int i = 3; i <= 40; i++) {
        int temp = a;
        a = b;
        b = temp + a;

        if (i % 10 == 0) {
            file << b << endl;
        }
    }

    file.close();

    return 0;
}
