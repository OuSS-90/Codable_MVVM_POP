//
//  AnimesPresenter.swift
//  CodableMVP
//
//  Created by OuSS on 4/30/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import Foundation

protocol AnimesDelegate: class{
    func showProgress()
    func hideProgress()
    func setAnimes(animes: [AnimeViewModel])
}

class AnimeListViewModel{
    weak var delegate: AnimesDelegate?
    
    init(delegate: AnimesDelegate) {
        self.delegate = delegate
    }
    
    func fetchAnimes(){
        delegate?.showProgress()
        AnimeService.instance.getAnimeList { (result) in
            self.delegate?.hideProgress()
            
            switch result {
            case .success(let season):
                let animes = season.anime.map{ AnimeViewModel($0)}
                self.delegate?.setAnimes(animes: animes)
            case .failure(let error):
                print(error)
            }
        }
    }
}
