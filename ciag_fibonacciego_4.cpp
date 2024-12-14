#include <iostream>
#include <cmath>
#include <fstream> 

using namespace std;

void konwertuj(int liczba, ofstream& file)
{
    string postac_binarna = "";
    int liczba_jedynek = 0;
    while (liczba > 0)
    {
        if (liczba % 2 == 0)
        {
            postac_binarna = "0" + postac_binarna;
        } else {
            postac_binarna = "1" + postac_binarna;
            liczba_jedynek++;
        }
        liczba /= 2;
    }
    if (liczba_jedynek == 6)
    {
        file << postac_binarna << endl;
    }
}

int main()
{

    ofstream file("wyniki.txt");

    if (!file.is_open()) {
        cerr << "Nie można otworzyć pliku wyniki.txt" << endl;
        return 1; 
    }

    int a = 1, b = 1;
    for (int i = 3; i < 40; i++)
    {
        int temp = a;
        a = b;
        b = temp + a;
        konwertuj(b, file);
    }

    file.close();

    return 0;
}
