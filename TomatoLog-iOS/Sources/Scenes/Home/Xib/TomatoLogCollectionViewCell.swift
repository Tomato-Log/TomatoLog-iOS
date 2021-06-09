//
//  TomatoLogCollectionViewCell.swift
//  TomatoLog-iOS
//
//  Created by ✨EUGENE✨ on 2021/05/20.
//

import UIKit

class TomatoLogCollectionViewCell: UICollectionViewCell {

    static let identifier = "\(TomatoLogCollectionViewCell.self)"
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var tomatoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setShadow()
        
    }
    func setShadow() {
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        view.layer.applySketchShadow(color: UIColor.black, alpha: 0.1, x: 0, y: 4, blur: 34, spread: 0)
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
    }
    func setCell(_ imageName: String, tomato: String) {
        
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: imageName)
        tomatoImage.image = UIImage(named: tomato)
        albumNameLabel.text = imageName
    }
}
