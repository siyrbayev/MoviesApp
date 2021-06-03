//
//  CastCollectionViewCell.swift
//  MovieApp
//
//  Created by ADMIN ODoYal on 03.06.2021.
//

import UIKit
import Kingfisher

class CastCollectionViewCell: UICollectionViewCell {
    static let identifier = "CastCollectionViewCell"
    static let nib = UINib(nibName: identifier, bundle: Bundle(identifier: identifier))
    
    private var cast: CastsEntity.Cast?{
        didSet{
            if let cast = cast {
                let profileURL = URL(string: "https://image.tmdb.org/t/p/w500" + (cast.profilePath ?? ""))
                profileImageView.kf.setImage(with: profileURL)
                nameLaabel.text = cast.name
                knownLabel.text = cast.known
            }
        }
    }
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nameLaabel: UILabel!
    @IBOutlet private weak var knownLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

// MARK: Public func
extension CastCollectionViewCell {
    func setCast(_ cast: CastsEntity.Cast) {
        self.cast = cast
        configureLayout()
    }
}

// MARK: Private func
extension CastCollectionViewCell {
    func configureLayout() {
        profileImageView.layer.cornerRadius = profileImageView.bounds.height/2
    }
}
