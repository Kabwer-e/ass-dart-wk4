import 'dart:io';

// Define an interface
abstract class Animal {
  String makeSound();
}

// Define a base class implementing Animal interface
class Dog implements Animal {
  String name;

  Dog(this.name);

  @override
  String makeSound() {
    return "Woof!";
  }
}

// Define a subclass of Dog that overrides the makeSound method
class LoudDog extends Dog {
  LoudDog(String name) : super(name);

  @override
  String makeSound() {
    return super.makeSound().toUpperCase();
  }
}

// Define a class that demonstrates initializing instance with data from a file
class PetShop {
  String filename;

  PetShop(this.filename);

  List<Dog> getDogs() {
    List<Dog> dogs = [];
    File file = File(filename);
    List<String> lines = file.readAsLinesSync();
    for (String line in lines) {
      String name = line.trim();
      dogs.add(Dog(name));
    }
    return dogs;
  }
}

// Define a method that demonstrates the use of a loop
void printDogSounds(List<Dog> dogs) {
  for (Dog dog in dogs) {
    print("${dog.name} says ${dog.makeSound()}");
  }
}

// Main program
void main() {
  // Initialize some dogs from a file
  PetShop petShop = PetShop("dogs.txt");
  List<Dog> dogs = petShop.getDogs();

  // Print sounds of dogs
  printDogSounds(dogs);

  // Create and print a loud dog
  LoudDog loudDog = LoudDog("Buddy");
  print("${loudDog.name} says ${loudDog.makeSound()}");
}
