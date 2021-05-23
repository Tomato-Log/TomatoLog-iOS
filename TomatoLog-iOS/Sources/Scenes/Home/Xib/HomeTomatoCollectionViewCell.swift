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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
        // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        
        // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
        // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
        // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)
        } else if scrollView.contentOffset.x < targetContentOffset.pointee.x {
            roundedIndex = ceil(index)
        } else {
            roundedIndex = round(index)
        }
        
        // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
//        if Int(roundedIndex) >= imageNames.count {
//            tomatoImageView.image = UIImage(named: imageNames.last!)
//        } else {
//            tomatoImageView.image = UIImage(named: imageNames[Int(roundedIndex)])
//        }
    }
}
