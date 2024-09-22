import UIKit
import Foundation

// FizzBuzz

for i in 1...100 {
    if i.isMultiple(of: 3) {
        print("Fizz")
    }
    if i.isMultiple(of: 5) {
        print("Buzz")
    }
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else {
        print(i)
    }
}

// Prime Numbers

func isPrime(_ number: Int) -> Bool {
    var isPrime = true
    for i in 2..<number {
        if number.isMultiple(of: i) {
            isPrime = false
            break
        }
    }
    return isPrime
}

// Temperature Converter

enum TempratureUnit {
    case celcius
    case fahrenheit
    case kelvin
}

func convertToCelsius(
    _ value: Double,
    unitType: TempratureUnit
) -> Double {
    if unitType == .celcius {
        return value
    } else if unitType == .fahrenheit {
        return (value - 32) * 5 / 9
    } else {
        return value + 273.15
    }
}

func convert(
    from: TempratureUnit,
    to: TempratureUnit,
    value: Double
) -> Double {
    if from == to {
        return value
    } else if from == .celcius {
        return convertToCelsius(value, unitType: to)
    } else if from == .fahrenheit {
        return convertToCelsius(value, unitType: .celcius) * 9 / 5 + 32
    } else {
        let celsius = convertToCelsius(value, unitType: .celcius)
        return convertToCelsius(celsius, unitType: to)
    }
}

// Shopping list

class ShoppingList {
    var items: [String] = []
    
    func add(item: String) {
        items.append(item)
    }
    
    func remove(item: String) {
        items.removeAll(where: { $0 == item })
    }
}

let list = ShoppingList()
list.add(item: "Apple")
list.add(item: "Banana")
list.add(item: "Orange")
list.remove(item: "Banana")
print(list)

// Word Frequency Counter

extension String {
    var numberOfWords: Int {
        var count = 0
        let range = startIndex..<endIndex
        enumerateSubstrings(in: range, options: [.byWords, .substringNotRequired, .localized], { _, _, _, _ -> () in
            count += 1
        })
        return count
    }
}

print("Hello, World!".numberOfWords)

// Fibonacci sequence
func fibonacci(_ n: Int) -> [Int] {
    if n < 2 {
        return Array(0..<n)
    }
    
    var result: [Int] = [0, 1]
    for i in 2..<n {
        result.append(result[i - 1] + result[i - 2])
    }
    return result
}

print(fibonacci(10))

// Grade Calculator

struct GradeCalculator {
    let grades: [String: Double] = [
        "Arman": 100,
        "Mukhit": 30,
        "Zholbarys": 10,
        "Zhanel": 100,
        "Yerke": 40
    ]
    
    func getAverageScore() -> Double {
        var result: Double = 0
        result = grades.reduce(0, { partialResult, it in
            partialResult + it.value
        })
        return result / Double(grades.count)
    }
    
    func getLowestScore() -> Double {
        var result: Double = 0
        for it in grades {
            result = min(result, it.value)
        }
        return result
    }
    
    func getHighestScore() -> Double {
        var result: Double = 0
        for it in grades {
            result = max(result, it.value)
        }
        return result
    }
    
    func showGrades() {
        for it in grades {
            print("\(it.key): \(it.value): is above average score \(it.value > getAverageScore())")
        }
    }
}

let gradeCalculator = GradeCalculator()
gradeCalculator.getAverageScore()
gradeCalculator.getLowestScore()
gradeCalculator.getHighestScore()
gradeCalculator.showGrades()

// Palindrome Checker

func isPalindrome(_ text: String) -> Bool {
    return text == String(text.reversed())
}

// simple calculator

enum CalculatorError: Error {
    case unknownOperation
}

struct SimpleCalculator {
    func calculate(_ operation: String, _ firstNumber: Double, _ secondNumber: Double) throws -> Double {
        switch operation {
        case "+": return firstNumber + secondNumber
        case "-": return firstNumber - secondNumber
        case "*": return firstNumber * secondNumber
        case "/": return firstNumber / secondNumber
        default: throw CalculatorError.unknownOperation
        }
    }
}

let calculator = SimpleCalculator()
do {
    try calculator.calculate("+", 10, 20)
    try calculator.calculate("-", 10, 20)
    try calculator.calculate("*", 10, 20)
    try calculator.calculate("/", 10, 20)
} catch {
    print(error)
}


// Unique characters

func hasUniqueCharacters(_ input: String) -> Bool {
    var characters: Set<Character> = []
    for character in input {
        if characters.contains(character) {
            return false
        }
        characters.insert(character)
    }
    return true
}

