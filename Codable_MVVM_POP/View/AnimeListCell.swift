//
//  AnimeCell.swift
//  CodableTuto
//
//  Created by OuSS on 2/23/19.
//  Copyright © 2019 OuSS. All rights reserved.
//

import UIKit
import SDWebImage

class AnimeListCell: UITableViewCell {
    
    var animeViewModel: AnimeViewModel? {
        didSet {
            titleLabel.text = animeViewModel?.title
            descLabel.text = animeViewModel?.synopsis
            guard let imageUrl = animeViewModel?.imageUrl else { return }
            imageV.sd_setImage(with: URL(string: imageUrl))
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let imageV: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    fileprivate func setupView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(imageV)
        
        titleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: imageV.leadingAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), size: CGSize(width: 0, height: 20))
        
        descLabel.anchor(top: titleLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: imageV.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
        
        imageV.anchor(top: contentView.topAnchor, leading: nil, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 16))
        
        imageV.widthAnchor.constraint(equalTo: imageV.heightAnchor, multiplier: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
