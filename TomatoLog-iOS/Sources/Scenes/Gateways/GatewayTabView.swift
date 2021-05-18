
import UIKit

import SnapKit


final class GatewayTabView: UIView {
    
    private class TabButton: UIButton {
        
        var endpoint: GatewayEndpoint = .home
        
        
        required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    private let homeTabButton: TabButton = {
        let button = TabButton()
        button.backgroundColor = .red
        button.setTitle("Home", for: .normal)
        button.endpoint = .home
        
        return button
    }()
    private let hotTabButton: TabButton = {
        let button = TabButton()
        button.backgroundColor = .green
        button.setTitle("Hot", for: .normal)
        button.endpoint = .hot
        
        return button
    }()
    private let feedTabButton: TabButton = {
        let button = TabButton()
        button.backgroundColor = .blue
        button.setTitle("Feed", for: .normal)
        button.endpoint = .feed
        
        return button
    }()
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = 49
    
    weak var delegate: GatewayTabViewDelegate?
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.defineUI()
        self.setConstraints()
    }
    
    private func defineUI() {
        self.addSubview(self.stackView)
        
        [self.homeTabButton, self.hotTabButton, self.feedTabButton].forEach {
            self.stackView.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(self.tabButtonDidTap(_:)), for: .touchUpInside)
        }
    }
    
    private func setConstraints() {
        self.snp.makeConstraints { make in
            make.width.equalTo(self.WIDTH)
            make.height.equalTo(self.HEIGHT)
        }
        
        self.stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func tabButtonDidTap(_ sender: TabButton) {
        self.delegate?.didSelectedEndpoint(at: sender.endpoint)
    }
}
