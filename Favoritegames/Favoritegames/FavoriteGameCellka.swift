//
//  FavoriteGameCellka.swift
//  Favoritegames
//
//  Created by Arman Sarvardin on 25.10.2024.
//

import Foundation
import UIKit

class FavoriteGameCellka: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        return label
    }()
    
    let gameImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [titleLabel, genreLabel, gameImageView].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
        }
        
        let constraints: [NSLayoutConstraint] = [
            gameImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            gameImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            gameImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16),
            gameImageView.widthAnchor.constraint(equalToConstant: 50),
            gameImageView.heightAnchor.constraint(equalToConstant: 50),

            titleLabel.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),

            genreLabel.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor, constant: 16),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            genreLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
        ]

        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func configure(with data: FavoriteGame) {
        titleLabel.text = data.title
        genreLabel.text = data.genre
        gameImageView.image = UIImage(named: data.imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
