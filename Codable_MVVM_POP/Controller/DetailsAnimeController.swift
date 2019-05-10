//
//  AnimeController.swift
//  CodableTuto
//
//  Created by OuSS on 2/23/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import UIKit

class DetailsAnimeController: UIViewController, UIScrollViewDelegate {
    
    var animeViewModel: AnimeViewModel? {
        didSet{
            navigationItem.title = animeViewModel?.title
            guard let imageUrl = animeViewModel?.imageUrl else { return }
            imageView.sd_setImage(with: URL(string: imageUrl))
            descLabel.text = animeViewModel?.synopsis
        }
    }
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.alwaysBounceVertical = true
        sv.contentInsetAdjustmentBehavior = .never
        sv.delegate = self
        return sv
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        
        let containerView = UIView()
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        scrollView.addSubview(containerView)
        containerView.fillSuperview()
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        containerView.addSubview(imageView)
        containerView.addSubview(descLabel)
        
        let width = view.frame.width
        
        imageView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        
        descLabel.anchor(top: imageView.bottomAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = min(0, scrollView.contentOffset.y)
        let width = max(view.frame.width - y , view.frame.width)
        imageView.frame = CGRect(x: 0, y: y , width: width, height: width)
        imageView.center.x = scrollView.center.x
    }
}
