//
//  HomeViewController.swift
//  TomatoLog-iOS
//
//  Created by ✨EUGENE✨ on 2021/05/19.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tomatoLogButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tomatoImageView: UIImageView!
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var tomatoImageHeight = 131.0
    
    // 임시로 이렇게 해두기
    var buttonLabel = "유숩 님의\n토마토 로그"
    
    var offset = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton()
        setCollectionView()
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        print("press success")
    }
    
    func setButton() {
        // 토마토 로그
        let boldFont = UIFont.boldSystemFont(ofSize: 22)
        
        let attributedStr = NSMutableAttributedString(string: buttonLabel)
        attributedStr.addAttribute(.font, value: boldFont, range: (buttonLabel as NSString).range(of: "유숩"))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 11
        attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedStr.length))

        tomatoLogButton.titleLabel?.numberOfLines = 2
        tomatoLogButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        tomatoLogButton.titleLabel?.tintColor = .black
        tomatoLogButton.setAttributedTitle(attributedStr, for: .normal)
        
        // 설정 버튼
        settingButton.tintColor = .black
        settingButton.setImage(R.image.btnSetting(), for: .normal)
        
        // 토마토 일단 여기에
        tomatoImageView.image = R.image.hotTomato()
        self.tomatoImageView.snp.makeConstraints {
            $0.height.width.equalTo(tomatoImageHeight)
            
        }
    }
    
    func setCollectionView() {
        
        let tomatoLogNib = UINib(nibName: HomeTomatoCollectionViewCell.identifier, bundle: nil)
        self.homeCollectionView.register(tomatoLogNib, forCellWithReuseIdentifier: HomeTomatoCollectionViewCell.identifier)
        let wishLogNib = UINib(nibName: HomeWishCollectionViewCell.identifier, bundle: nil)
        self.homeCollectionView.register(wishLogNib, forCellWithReuseIdentifier: HomeWishCollectionViewCell.identifier)
        
        
        homeCollectionView.layer.masksToBounds = false
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
}
extension HomeViewController: UICollectionViewDataSource {
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section == 1 {
//            return numberOfItems
//        } else {
//            return numberOfItems
//        }
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTomatoCollectionViewCell.identifier, for: indexPath) as! HomeTomatoCollectionViewCell
            cell.setCollectionView()
            cell.layer.masksToBounds = false
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeWishCollectionViewCell.identifier, for: indexPath) as! HomeWishCollectionViewCell
            cell.setCollectionView()
            cell.layer.masksToBounds = false
            return cell
        }
        
    }
    
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellHeight: CGFloat = 0
        
        if indexPath.row == 0 {
            cellHeight = collectionView.frame.height * 0.6
        } else {
            cellHeight = collectionView.frame.height * 0.59
        }
        let cellWidth = collectionView.frame.width
        return CGSize(width: cellWidth, height: cellHeight)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
}
extension HomeViewController : UIScrollViewDelegate {
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        offset = targetContentOffset.pointee
//        print("offset \(offset.y)")
//
//        self.tomatoImageView.snp.remakeConstraints {
//            $0.height.equalTo(tomatoImageHeight - Double(offset.y))
//        }
//
//    }
    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//
//
//
//    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//
//        print("DidEndDecelerating 중 ~~ \(self.homeCollectionView.contentOffset.y)")
//
//        if Double(self.homeCollectionView.contentOffset.y) > 0.0 {
//            self.tomatoImageView.snp.remakeConstraints {
//                $0.height.equalTo(tomatoImageHeight)
//            }
//        }
//    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("스크롤 중 ~~ \(self.homeCollectionView.contentOffset.y)")

        if Double(self.homeCollectionView.contentOffset.y) > 0.0 {
            self.tomatoImageView.snp.remakeConstraints {
                $0.height.equalTo(tomatoImageHeight - Double(self.homeCollectionView.contentOffset.y))
            }
        } else if Double(self.homeCollectionView.contentOffset.y) > Double(tomatoLogButton.frame.maxY) {
//            self.homeCollectionView.isScrollEnabled = false
        }
        
    }
    
//    func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
//                             withScrollingVelocity velocity: CGPoint) -> CGPoint {
//
//    }
}
