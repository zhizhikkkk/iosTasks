import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let imageName: String
    let releaseDate: Date
    
    static var all: [Movie] {
        [
            .init(
                id: 1,
                title: "The Shawshank Redemption",
                description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
                imageName: "shawshank",
                releaseDate: .init(timeIntervalSince1970: 15156)
            ),
            .init(
                id: 2,
                title: "The Godfather",
                description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
                imageName: "godfather",
                releaseDate: .init(timeIntervalSince1970: 1472563200)
            ),
            .init(
                id: 3,
                title: "The Dark Knight",
                description: "When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.",
                imageName: "dark-knight",
                releaseDate: .init(timeIntervalSince1970: 1488451200)
            ),
            .init(
                id: 4,
                title: "The Lord of the Rings: The Return of the King",
                description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
                imageName: "lord-of-the-rings",
                releaseDate: .init(timeIntervalSince1970: 1449129600)
            ),
            .init(
                id: 5,
                title: "Pulp Fiction",
                description: "The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
                imageName: "pulp-fiction",
                releaseDate: .init(timeIntervalSince1970: 1468550400)
            ),
            .init(
                id: 6,
                title: "Schindler's List",
                description: "In German-occupied Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
                imageName: "schindler",
                releaseDate: .init(timeIntervalSince1970: 1462441600)
            ),
            .init(
                id: 7,
                title: "The Good, the Bad and the Ugly",
                description: "A bounty hunting scam joins three men in the search for a hidden fortune, while an outlaw bandit tries to find it first.",
                imageName: "good-bad-ugly",
                releaseDate: .init(timeIntervalSince1970: 1465632000)
            ),
            .init(
                id: 8,
                title: "The Lord of the Rings: The Fellowship of the Ring",
                description: "A young hobbit named Frodo Baggins is tasked with destroying a powerful artifact, the One Ring, which could bring about the destruction of Middle-earth.",
                imageName: "lord-of-the-rings",
                releaseDate: .init(timeIntervalSince1970: 1447772800)
            ),
            .init(
                id: 9,
                title: "The Lord of the Rings: The Two Towers",
                description: "Frodo and Sam continue their journey to Mount Doom, while Aragorn, Gandalf, and Legolas join forces to defend Middle-earth from Sauron's forces.",
                imageName: "lord-of-the-rings",
                releaseDate: .init(timeIntervalSince1970: 1454451200)
            ),
            .init(
                id: 10,
                title: "12 Angry Men",
                description: "A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.",
                imageName: "12-angry-men",
                releaseDate: .init(timeIntervalSince1970: 1456542400)
            )
        ]
    }
}
