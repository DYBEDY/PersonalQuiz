//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var resultTextLabel: UILabel!
    @IBOutlet var emojiResult: UILabel!
    
    var results:[Answer]!
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим живтным
    // 4. Избавится от кнопки возврата назад на экран результатов

    override func viewDidLoad() {
        super.viewDidLoad()
        emojiResult.text = "Вы -  \(String(moreFrequentTypeOfAnimal().rawValue)) !"
        resultTextLabel.text = String(moreFrequentTypeOfAnimal().definition)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    

}

// MARK: - Private methods
extension ResultsViewController {
    private  func moreFrequentTypeOfAnimal() -> AnimalType {
        var freqauencyOfAnimals: [ AnimalType : Int] = [:]
        let animals = results.map { $0.type }
        var sortedAnimals: [AnimalType] = []
        
        for animal in animals {
            if let animalTypeCount = freqauencyOfAnimals[animal] {
                freqauencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                freqauencyOfAnimals[animal] = 1
            }
        }
        
        
        for (animal, _) in (Array(freqauencyOfAnimals.sorted { $0.1 > $1.1 })) {
            sortedAnimals.append(animal)
        }
        return sortedAnimals[0]
    }
}


    
    
    
    
    

