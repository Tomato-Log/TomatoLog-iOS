//
//  HeaderCollectionReusableView.swift
//  TomatoLog-iOS
//
//  Created by ✨EUGENE✨ on 2021/05/26.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "볼래요 로그"
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    public func configure() {
        backgroundColor = .white
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
