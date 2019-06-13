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
    var fullName: FullName {
        get {
            return FullName(description: lastName + " " + name) //возвращаем Фамилия + пробел + имя
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
