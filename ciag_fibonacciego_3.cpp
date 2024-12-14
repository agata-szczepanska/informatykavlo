#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <fstream>

using namespace std;

string konwertuj(int liczba)
{
    string postac_binarna = "";
    while (liczba > 0) {
        if (liczba % 2 == 0)
            postac_binarna = "0" + postac_binarna;
        else
            postac_binarna = "1" + postac_binarna;
        liczba /= 2;
    }
    if (postac_binarna.empty()) {
        postac_binarna = "0";
    }
    return postac_binarna;
}

int main() {

    ofstream file("wyniki.txt");

    if (!file.is_open()) {
        cerr << "Nie można otworzyć pliku wyniki.txt" << endl;
        return 1;
    }

    int a = 1, b = 1;
    vector<string> B(41);
    B[1] = "1";
    B[2] = "1";

    for (int i = 3; i <= 40; i++) {
        int temp = a;
        a = b;
        b = temp + a;
        B[i] = konwertuj(b);
    }

    int max_lenght = B[40].size();

    for (int i = 1; i <= 40; i++) {
        int roznica = max_lenght - B[i].size();
        for (int j = 0; j < roznica; j++) {
            B[i] = "0" + B[i];
        }
    }

    for (int i = 1; i <= 40; i++) {
        file << B[i] << endl;
    }

    file.close();

    return 0;
}
