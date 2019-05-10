//
//  AnimeViewModel.swift
//  CodableMVP
//
//  Created by OuSS on 5/9/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import Foundation

struct AnimeViewModel {
    let title: String
    let imageUrl: String
    let synopsis: String
    
    init(_ anime: Anime) {
        self.title = anime.title
        self.imageUrl = anime.imageUrl
        self.synopsis = anime.synopsis
    }
}
