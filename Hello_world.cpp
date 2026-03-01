#include <iostream>
using namespace std;

int main() {
    string name;

    cout << "Enter your name: ";
    getline(cin, name);

    cout << "Hello world, " << name << "!" << endl;

    return 0;
}