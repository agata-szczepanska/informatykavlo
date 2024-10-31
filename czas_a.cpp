#include <iostream>
#include <chrono>

using namespace std;

// Sprawdza czy liczba jest pierwsza (wszystkie dzielniki do k-1)
bool isPrimeNaive(int number) {
    if (number <= 1) return false;
    for (int i = 2; i < number; i++) { // Sprawdzamy do k-1
        if (number % i == 0) return false;
    }
    return true;
}

// Liczy ilosc liczb pierwszych od 1 do n
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
