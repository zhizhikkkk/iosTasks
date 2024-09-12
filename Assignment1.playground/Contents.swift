import UIKit

public struct Person {
    let firstName: String
    let lastName: String
    let birthYear: Int
    let isStudent: Bool
    var height: Double
    
    private let currentYear: Int = 2024
    
    var age: Int {
        return currentYear - birthYear
    }
    
    var hobby: String
    var numberOfHobbies: Int
    var isHobbyCreative: Bool
    var favoriteNumber: Int
    
    var lifeStory: String {
        return """
"My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). \(isStudent ? "I am currently a student." : "") I enjoy \(hobby), which is \(isHobbyCreative ? "" : "not") a creative hobby. I have \(numberOfHobbies) hobb\(numberOfHobbies > 1 ? "ies" : "y") in total, and my favorite number is \(favoriteNumber). \(futureGoals)
"""
    }
    
    let futureGoals: String = "In the future I want to become a professional IOS developer🍏."
}


let person = Person(
    firstName: "Zhanel",
    lastName: "Mamyt",
    birthYear: 2004,
    isStudent: true,
    height: 1.75,
    hobby: "playing Counter-Strike",
    numberOfHobbies: 1,
    isHobbyCreative: false,
    favoriteNumber: 4
)

print(person.lifeStory)
