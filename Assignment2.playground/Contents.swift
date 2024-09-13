import UIKit


// MARK: - Easy tasks

// 1
let fruits: [String] = ["Apple", "Banana", "Orange", "Pear", "Strawberry"]
print(fruits[2])

// 2
var favoriteNumbers: Set<Int> = [1, 2, 3, 4, 5]
favoriteNumbers.insert(13)
print(favoriteNumbers)

// 3
var programmingLanguages: [String: Int] = [
    "Swift": 2013,
    "Objective-C": 1984,
    "C++": 1985
]
print(programmingLanguages["Swift"])

// 4
var colours: [String] = ["Red", "Blue", "Green"]
colours[1] = "Yellow"
print(colours[1])

// MARK: - Medium tasks

// 1
let firstSet: Set<Int> = [1, 2, 3, 4]
let secondSet: Set<Int> = [3, 4, 5, 6]

print(firstSet.intersection(secondSet))

// 2
var studentsScore: [String: Double] = [
    "Zhanel": 100,
    "Erdaut": 55.5,
    "Zhandos": 75.8
]

studentsScore["Zhanel"] = 200.99

print(studentsScore)

// 3
let firstArray = ["apple", "banana"]
let secondArray = ["cherry", "date"]

print(firstArray + secondArray)

// MARK: - Hard tasks
//1
var countryPopulations: [String: Int] = [
    "France": 67_000_000,
    "Kazakhstan": 18_000_000,
    "Russia": 147_000_000,
    "Japan": 125_000_000
]

countryPopulations["Kyrgyzstan"] = 11_000_000

print(countryPopulations)
// 2
func setUnionAndSubstract() -> Set<String> {
    let firstSet: Set<String> = ["cat", "dog"]
    let secondSet: Set<String> = ["dog", "mouse"]
    
    return firstSet
        .union(secondSet)
        .subtracting(secondSet)
}

print(setUnionAndSubstract())

