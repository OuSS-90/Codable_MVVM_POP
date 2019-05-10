//
//  AnimeService.swift
//  CodableTuto
//
//  Created by OuSS on 2/23/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import Foundation

enum animeError: Error {
    case noData
}

class AnimeService {
    
    static let instance = AnimeService()
    let baseURL = "https://api.jikan.moe/v3/"
    
    
    func getAnimeList(completion: @escaping (_ result: Result<Season,Error>) -> Void) {
        
        guard let url = URL(string: baseURL + "season/2019/winter") else {
            completion(.failure(animeError.noData))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let season = try JSONDecoder().decode(Season.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(season))
                }
            } catch let err {
                print(err)
            }
        }.resume()
    }
    
}
