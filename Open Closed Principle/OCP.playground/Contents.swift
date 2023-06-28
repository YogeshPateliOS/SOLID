import UIKit

/*
 Open-Closed Principle
 Class should be opened for extension but closed for modification
 */

/*
 Open for extension
 Closed for modification
 */

/*
 In short, you should be able to add almost any new feature to your class easily and will not have to re-structure your whole class as we all know that going through re-structuring could result in additional time in development and also testing.

 */

protocol Animal {
    func makeSound() -> String
}

class Tiger: Animal {

    func makeSound() -> String {
        return "Roar"
    }

}

class Horse: Animal {

    func makeSound() -> String {
        return "Neigh"
    }

}

class Zoo {

    let animals: [Animal] = []

    func animalNoise(animal: Animal) -> String {
        if animal is Tiger {
            return (animal as! Tiger).makeSound()
        }else if animal is Horse {
            return (animal as! Horse).makeSound()
        }
        return ""
    }

    func animalSounds() -> [String] {
        animals.map { $0.makeSound() }
    }

}


let tiger = Tiger()
let horse = Horse()

let zooAnimals = Zoo()
zooAnimals.animalNoise(animal: tiger)
zooAnimals.animalNoise(animal: horse)
zooAnimals.animalSounds()
//zooAnimals.animalNoise(animal: [tiger, horse])
