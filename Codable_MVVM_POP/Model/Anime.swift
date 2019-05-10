//
//  Anime.swift
//  CodableTuto
//
//  Created by OuSS on 2/23/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import Foundation

struct Season: Decodable {
    let anime: [Anime]
}

struct Anime: Decodable {
    let title: String
    let imageUrl: String
    let synopsis: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageUrl = "image_url"
        case synopsis
    }
}
