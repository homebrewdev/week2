//
//  main.swift
//  week2
//
//  Created by tiger on 12.06.2019.
//  Copyright © 2019 homework. All rights reserved.
//

import Foundation

// структуры и классы
class SomeClass {
    // здесь пишется определение класса
}
struct SomeStructure {
    // здесь пишется определение структуры
}

// например структура
struct Resolution {
    var width = 640
    var height = 480
}

// пример объявления класса
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//Объявление структуры Resolution и класса VideoMode только описывают как Resolution и VideoMode будут выглядеть. Сами по себе они не описывают специфическое разрешение или видеорежим. Для того чтобы это сделать нам нужно создать экземпляр структуры или класса.
//Синтаксис для образования экземпляра класса или структуры очень схож:
let myResolution = Resolution()
let myVideoMode = VideoMode()

// доступ к свойствам структур и классов через .
print("The width of someResolution is \(myResolution.width)") //Выведет "The width of someResolution is 640"

myVideoMode.resolution.width = 1280
print("The width of myVideoMode is now \(myVideoMode.resolution.width)")
// Выведет "The width of myVideoMode is now 1280"

// Все структуры имеют автоматически генерированный "поэлементный инициализатор", который вы можете использовать для инициализации свойств новых экземпляров структуры. Начальные значения для свойств нового экземпляра могут быть переданы поэлементному инициализатору по имени:
let VGA = Resolution(width: 640, height: 480)
// классы такой возможности не обладают

//Все структуры и перечисления - типы значений в Swift. Это значит, что любой экземпляр структуры и перечисления, который вы создаете, и любые типы значений, которые они имеют в качестве свойств, всегда копируются, когда он передается по вашему коду.
// например
let hd = Resolution(width: 1920, height: 1080)
var cinemaMode = hd

//Этот пример объявляет константу hd и присваивает экземпляр Resolution, инициализированное двумя значениями width и height.
//В свою очередь объявляем переменную cinema и присваиваем ей текущее значение hd. Так как Resolution - структура, делается копия существующего экземпляра, и эта новая копия присваивается cinemaMode. Даже не смотря на то, что hd и cinema имеют одни и те же height, width, они являются абсолютно разными экземплярами.
// если мы поменяем значение у cinemaMode то значение hd останется прежним
cinemaMode.height = 2048
print(hd.height) // 1080
print(cinemaMode.height) // 2048

// в отличии от типа значений ( к которому относится структура) классы являются ссылочными типами
// В отличии от типа значений, ссылочный тип не копируется, когда его присваивают переменной или константе, или когда его передают функции. Вместо копирования используется ссылка на существующий экземпляр.
// Вот пример с использованием класса VideoMode, который был объявлен выше:
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
print(tenEighty.frameRate)  //25.0
// если же мы объявим еще одну константу ( по сути ссылку на экземпляр класса) то поменяв значение свойства мы изменим значение в экземпляре (объекте)
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print(tenEighty.frameRate) // 30.0

// Этот пример показывает как сложно бывает отследить за ссылочными типами. Если tenEighty и alsoTenEighty находились бы в разных уголках вашей программы, то было бы сложно найти все места, где мы меняем режим воспроизведения видео. Где бы вы не использовали tenEighty, вам так же бы приходилось думать и о alsoTenEighty, и наоборот. В отличии от ссылочного типа, с типами значения дела обстоят значительно проще, так как весь код, который взаимодействует с одним и тем же значением, находится рядом, в вашем исходном файле.


// Иногда бывает полезно выяснить ссылаются ли две константы или переменные на один и тот же экземпляр класса. Для проверки этого в Swift есть два оператора тождественности:
// Идентичен (===)
// Не идентичен ( !== )
// Можно использовать эти операторы для проверки того, ссылаются ли две константы или переменные на один и тот же экземпляр:
if tenEighty === alsoTenEighty {
    print("tenEighty и alsoTenEighty идентичны одному экземпляру класса")
}

//В Swift константы и переменные, которые ссылаются на экземпляр какого-либо ссылочного типа, аналогичны указателям C, но это не прямые указатели на адрес памяти, и они не требуют от вас написания звездочки(*) для индикации того, что вы создаете ссылку. Вместо этого такие ссылки объявляются как другие константы или переменные в Swift. Стандартная библиотека предоставляет типы указателей и буферов, которые вы можете использовать, если вам нужно напрямую взаимодействовать с указателями

// MARK: - решение задачи #1
// задача №1
// 1.Создать типы:
//struct Name {

//class Name { // класс из свойства структуры
//    Var string
//При помощи print() строковых свойств показать различие value/reference type. Копируется ли свойство структуры, которое является классом при копировании самой структуры?

let somePerson = Buyer()
var custom = Custom(client: somePerson, pay_amount: 40.0, productName: "Булка")
var custom2 = Custom(client: somePerson, pay_amount: 120.0, productName: "Тушонка")


print("Покупатель: \(custom.client)")   // Покупатель: week2.Buyer
print("Покупатель2: \(custom2.client)") // Покупатель: week2.Buyer
print("Покупатель купил: \(String(describing: custom.productName)) по цене = \(custom.pay_amount)")
print("Покупатель замечен в кражах? ответ: \(custom2.client.fraudStatus)") // Покупатель замечен в кражах? false
// доказано - при копировании структуры custom2 свойство структуры класс Buyer остался тот же somePerson = Buyer() Покупатель: week2.Buyer Покупатель2: week2.Buyer


// MARK: - эксперименты из примеров в swiftbook
//Вычисляемые свойства
//В дополнение к свойствам хранения, классам, структурам и перечислениям можно добавить вычисляемые свойства, которые фактически не хранят значения. Вместо этого они предоставляют геттер и опциональный сеттер для получения и установки других свойств косвенно.
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Выведет "square.origin is now at (10.0, 10.0)"


// MARK: - тест задачи 2
//Задача 2 :
//Создать структуру Person с stored property name, lastName и computed property fullName. fullName должен иметь и геттер и сеттер. Пусть первое слово в сеттере будет именем
var persona = Person(name: "John", lastName: "Bro")

// проверяем геттер
print(persona.fullName) //Bro John

// проверяем сеттер 
persona.fullName = "Джон Джонович"
print(persona.name) // Джон
print(persona.lastName) // Джонович

//  MARK: - Задача 3
//  3. Создать структуру со свойством типа стринг и subscript методом, возвращающим/устанавливающим символ по соответствующему индексу
var ex = Example(sample: "строка")
// проверка работы геттера сабскрипта
print("Символ по индексу 2 = \(ex[index:2, character: "s"])") // Символ по индексу 2 = р

let insertSomeChar = ex[index: 2, character: "f"]
print(ex.sample)


// MARK: -  Задача 4
//4. Создать класс Shape с методом area, возвращающим площадь и методом shapeDescription возвращающим «shape is»
//Создать подклассы Circle, Square с нужным для вычисления площади свойствами и методами инициализации. Переопределить нужные методы суперкласса. shapeDescription должен вернуть shape is circle и shape is square соответственно.
//Создать несколько разных экземпляров каждого класса и поместить их в array. Проитерировав array напечатать shapeDescription и площадь

let sqr = Square(size: 6.0, name: "Квадрат 5 на 5")
let circle = Circle(radius: 8.7, name: "Круг 8.7")

let sqr2 = Square(size: 10.0, name: "Квадрат 10 на 10")
let circle2 = Circle(radius: 15.5, name: "Круг 15")

print("Площадь квадрата размером \(sqr.size) = \(sqr.areaSize)") // Площадь квадрата размером 6.0 = 36.0
print("Площадь круга радиусом \(circle.radius)= \(circle.areaSize)") // Площадь круга радиусом 8.7= 237.66659999999996

print(sqr.shapeDescription()) // shape is Квадрат 5 на 5
print(circle.shapeDescription()) // shape is Круг 8.7


//Создать несколько разных экземпляров каждого класса и поместить их в array. Проитерировав array напечатать shapeDescription и площадь
var figuresArray: Array<Shape> = [sqr, sqr2, circle, circle2]

for figure in figuresArray {
    print("Описание: \(figure.shapeDescription())")
    print("Площадь данной фигуры: \(figure.areaSize)")
    print("--------------------------------------------------")
}
// вывод в консоль:
// Описание: shape is Квадрат 5 на 5
// Площадь данной фигуры: 36.0
// --------------------------------------------------
// Описание: shape is Квадрат 10 на 10
// Площадь данной фигуры: 100.0
// --------------------------------------------------
// Описание: shape is Круг 8.7
// Площадь данной фигуры: 237.66659999999996
// --------------------------------------------------
// Описание: shape is Круг 15
// Площадь данной фигуры: 754.385
// --------------------------------------------------
