//
//  HomeWishCollectionViewCell.swift
//  TomatoLog-iOS
//
//  Created by ✨EUGENE✨ on 2021/05/20.
//

import UIKit

class HomeWishCollectionViewCell: UICollectionViewCell {

    static let identifier = "\(HomeWishCollectionViewCell.self)"
    @IBOutlet weak var WishLogButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 임시
    var imageNames = ["blue", "trxye", "wild", "mymymy", "bloom", "nevernot", "paris", "feelings", "imfeeling", "superhero"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        WishLogButton.tintColor = .black
        WishLogButton.setTitle("볼래요 로그", for: .normal)
        WishLogButton.titleLabel?.textAlignment = .left
        WishLogButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }

    func setCollectionView(){
        let tomatoLogNib = UINib(nibName: WishCollectionViewCell.identifier, bundle: nil)
        self.collectionView.register(tomatoLogNib, forCellWithReuseIdentifier: WishCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension HomeWishCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: WishCollectionViewCell.identifier, for: indexPath) as! WishCollectionViewCell
        cell.setCell(imageNames[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.frame.height * 0.73
        let cellWidth = collectionView.frame.width / 4.3
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 20, bottom: 49, right: 0)
    }
    
}
