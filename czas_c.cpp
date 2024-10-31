#include <iostream>
#include <chrono>
#include <cmath>

using namespace std;

// Sprawdzam, czy liczba pierwsza, dla nieparzystych 
bool isPrimeNaive(int number) {
    if (number <= 1) return false;      // 0 i 1 nie są pierwsze
    if (number == 2) return true;       // 2 jest liczbą pierwszą
    if (number % 2 == 0) return false;  // pomijamy parzyste > 2

    for (int i = 3; i < sqrt(number); i += 2) { // pętla co 2
        if (number % i == 0) return false;
    }
    return true;
}


int countPrimesNaive(int n) {
    int primeCount = 0;
    for (int k = 1; k <= n; k++) {
        if (isPrimeNaive(k)) {
            primeCount++;
        }
    }
    return primeCount;
}

int main() {
    int n_values[] = {1000, 10000, 100000, 1000000};
    
    for (int n : n_values) {
        auto start = chrono::high_resolution_clock::now();
        int primeCount = countPrimesNaive(n);
        auto end = chrono::high_resolution_clock::now();

        chrono::duration<double> duration = end - start;
        cout << "Dla n = " << n << " liczba liczb pierwszych: " << primeCount 
             << ", czas: " << duration.count() << " sek" << endl;
    }
    
    return 0;
}
