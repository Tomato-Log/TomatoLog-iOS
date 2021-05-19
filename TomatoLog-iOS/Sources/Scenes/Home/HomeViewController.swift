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
    
    // 임시로 이렇게 해두기
    var buttonLabel = "유숩 님의 영화 로그\n전체보기"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton()
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        print("press success")
    }
    
    func setButton() {
        // 토마토 로그
        let boldFont = UIFont.boldSystemFont(ofSize: 18)
        let smallFont = UIFont.systemFont(ofSize: 12)
        
        let attributedStr = NSMutableAttributedString(string: buttonLabel)
        attributedStr.addAttribute(.font, value: boldFont, range: (buttonLabel as NSString).range(of: "유숩"))
        attributedStr.addAttribute(.font, value: smallFont, range: (buttonLabel as NSString).range(of: "전체보기"))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 11
        attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedStr.length))

        tomatoLogButton.titleLabel?.numberOfLines = 2
        tomatoLogButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        tomatoLogButton.titleLabel?.tintColor = .black
        tomatoLogButton.setAttributedTitle(attributedStr, for: .normal)
        
        // 설정 버튼
        settingButton.tintColor = .black
        settingButton.setImage(R.image.btnSetting(), for: .normal)
    }
}
