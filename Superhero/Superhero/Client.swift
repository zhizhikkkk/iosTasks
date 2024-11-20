//
//  Client.swift
//  Superhero
//
//  Created by Arman Sarvardin on 20.11.2024.
//

import Foundation

struct Client {
    
    let baseURL = URL(string: "https://akabab.github.io/superhero-api/api")!
    
    func getAllHeroes() async throws -> HeroesResponse {
        let requestURL = baseURL.appendingPathComponent("all.json")
        let request = URLRequest(url: requestURL)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
    
        let decoder = JSONDecoder()
        let heroes = try decoder.decode(HeroesResponse.self, from: data)
        
        return heroes
    }
}
