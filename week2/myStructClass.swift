//
//  myStructClass.swift
//  week2
//
//  Created by tiger on 12.06.2019.
//  Copyright © 2019 homework. All rights reserved.
//

import Foundation

// Структура покупка Custom
struct Custom {
    var client: Buyer
    var pay_amount: Double
    var productName: String?
}

// класс покупатель Buyer
class Buyer {
    var id: Int = 0
    var name: String?
    var lastName: String?
    var fullName: String?
    var score: Double = 0.0
    var fraudStatus: Bool = false
}

//  MARK: - Задача 2
//2. Создать структуру Person с stored property name, lastName и computed property fullName. fullName должен иметь и геттер и сеттер. Пусть первое слово в сеттере будет именем
struct FullName {
    var description: String
}

struct Person {
    var name: String
    var lastName: String
    var fullName: String {
        get {
            return lastName + " " + name //возвращаем Фамилия + пробел + имя
        }
        set(newFullName) {
            var str = newFullName.description // полностью строка с именем + пробелом + фамилией
            let indexOfSpace = str.index(of: " ") ?? str.endIndex
            name = String(str[..<indexOfSpace]) // эта часть до пробела = Имя -> name
            str.remove(at: indexOfSpace)  // удаляем пробел из строки
            lastName = String(str[indexOfSpace...]) // и потом спокойно оставшуюся часть пишем в lastName
        }
    }
}

//  MARK: - Задача 3
//  3. Создать структуру со свойством типа стринг и subscript методом, возвращающим/устанавливающим символ по соответствующему индексу
struct Example {
    var sample: String
    
    subscript (index index: Int, character char: Character) -> Character {
        get{
            var characters = Array(sample)
            let character = characters[index]
            return character
        }
        set{
            //var characters = Array(sample)
            //characters.insert(char, at: index)
            //sample = String(characters)
            sample.insert(char, at: sample.index(sample.startIndex, offsetBy: index))
        }
    }
}

// MARK: -  Задача 4
//4. Создать класс Shape с методом area, возвращающим площадь и методом shapeDescription возвращающим «shape is»
//Создать подклассы Circle, Square с нужным для вычисления площади свойствами и методами инициализации. Переопределить нужные методы суперкласса. shapeDescription должен вернуть shape is circle и shape is square соответственно.
//Создать несколько разных экземпляров каждого класса и поместить их в array. Проитерировав array напечатать shapeDescription и площадь

class Shape {
    var name: String = "Shape"
    var areaSize: Double = 0.0
    
    func shapeDescription() -> String {
        return "shape is \(name)"
    }
    
    init() {}
    
}

class Circle: Shape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init()
        self.name = name
        self.areaSize = 3.14 * radius * radius
    }
    
}

class Square: Shape {
    var size: Double = 0.0
    
    init(size: Double, name: String) {
        self.size = size
        super.init()
        self.name = name
        self.areaSize = size * size
    }
    
}

