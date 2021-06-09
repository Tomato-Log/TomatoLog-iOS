//
//  WishCollectionViewCell.swift
//  TomatoLog-iOS
//
//  Created by ✨EUGENE✨ on 2021/05/20.
//

import UIKit

class WishCollectionViewCell: UICollectionViewCell {

    static let identifier = "\(WishCollectionViewCell.self)"
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(_ imageName: String){
        posterImageView.layer.cornerRadius = 16
        posterImageView.image = UIImage(named: imageName)
        
        titleLabel.text = imageName
        titleLabel.font = UIFont.systemFont(ofSize: 12)
    }

}
