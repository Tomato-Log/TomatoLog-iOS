//
//  HomeTomatoCollectionViewCell.swift
//  TomatoLog-iOS
//
//  Created by ✨EUGENE✨ on 2021/05/20.
//

import UIKit
import SnapKit

class HomeTomatoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "\(HomeTomatoCollectionViewCell.self)"
    let cellSize = CGSize(width: 200, height: 200)
    var minItemSpacing: CGFloat = 20
    
    var currentIndex: CGFloat = 0 // 현재 인덱스
    
    // 임시
    var imageNames = ["blue", "trxye", "wild", "mymymy", "bloom", "nevernot", "paris", "feelings", "imfeeling", "superhero"]
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewAllButton = UIButton()
    
    var delegate: HomeViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewAllButton.setTitle("전체보기 >", for: .normal)
        baseView.addSubview(viewAllButton)
        viewAllButton.snp.makeConstraints {
            $0.centerY.equalTo(baseView)
            $0.right.equalTo(baseView).offset(14)
        }
    }
    func setCollectionView() {
        
        let layout = CarouselLayout()
        layout.itemSize = CGSize(width: 154, height: 205) // 임시
        layout.sideItemScale = 0.77
        layout.spacing = 20
        layout.isPagingEnabled = true
        
        let tomatoLogNib = UINib(nibName: TomatoLogCollectionViewCell.identifier, bundle: nil)
        self.collectionView.register(tomatoLogNib, forCellWithReuseIdentifier: TomatoLogCollectionViewCell.identifier)
        
        
        collectionView.collectionViewLayout = layout
        collectionView.layer.masksToBounds = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension HomeTomatoCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TomatoLogCollectionViewCell.identifier, for: indexPath) as! TomatoLogCollectionViewCell
        cell.setCell(imageNames[indexPath.row])
        cell.setShadow()
        cell.layer.masksToBounds = false
        return cell
    }
}
extension HomeTomatoCollectionViewCell : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing

        let offset = collectionView.contentOffset
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        
        if scrollView.contentOffset.x > offset.x {
            roundedIndex = floor(index)
        } else if scrollView.contentOffset.x < offset.x {
            roundedIndex = ceil(index)
        } else {
            roundedIndex = round(index)
        }
        
        if let delegate = delegate {
            print("roundedIndex \(roundedIndex)")
            if Int(roundedIndex) >= imageNames.count {
                delegate.didSelectedImage(at: imageNames.last!)
            } else if Int(roundedIndex) < 0 {
                delegate.didSelectedImage(at: imageNames[0])
            }
            else {
                delegate.didSelectedImage(at: imageNames[Int(roundedIndex)])
            }
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        
        if scrollView.contentOffset.x > offset.x {
            roundedIndex = floor(index)
        } else if scrollView.contentOffset.x < offset.x {
            roundedIndex = ceil(index)
        } else {
            roundedIndex = round(index)
        }
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
