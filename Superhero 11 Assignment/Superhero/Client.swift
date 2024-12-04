//
//  Client.swift
//  Superhero
//
//  Created by Arman Sarvardin on 20.11.2024.
//

import Foundation
import Alamofire

struct Client {
    
    let baseURL = URL(string: "https://akabab.github.io/superhero-api/api")!
    
    func getAllHeroes() async throws -> HeroesResponse {
        let requestURL = baseURL.appendingPathComponent("all.json")
        let request = URLRequest(url: requestURL)
        
        let result = await AF.request(request, interceptor: .retryPolicy)
            .serializingDecodable(HeroesResponse.self)
            .response
        
        guard let response = result.value else { throw result.error ?? URLError(.unknown) }

        
        return response
    }
}
