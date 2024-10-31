#include <iostream>
#include <chrono>
#include <vector>

using namespace std;

// Sito Eratostenesa 
int countPrimesSieve(int n) {
    vector<bool> isPrime(n + 1, true); // true oznacza liczbę pierwszą
    isPrime[0] = isPrime[1] = false;    

    for (int i = 2; i * i <= n; ++i) {
        if (isPrime[i]) {
            for (int j = i * i; j <= n; j += i) {
                isPrime[j] = false; // oznaczanie wielokrotności jako niepierwsze
            }
        }
    }

    int primeCount = 0;
    for (bool prime : isPrime) {
        if (prime) primeCount++;
    }

    return primeCount;
}

int main() {
    int n_values[] = {1000, 10000, 100000, 1000000};
    
    for (int n : n_values) {
        auto start = chrono::high_resolution_clock::now();
        int primeCount = countPrimesSieve(n);
        auto end = chrono::high_resolution_clock::now();

        chrono::duration<double> duration = end - start;
        cout << "Dla n = " << n << " liczba liczb pierwszych: " << primeCount 
             << ", czas: " << duration.count() << " sek" << endl;
    }
    
    return 0;
}
