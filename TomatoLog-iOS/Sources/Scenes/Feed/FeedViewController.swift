
import UIKit

import SnapKit


final class FeedViewController: UIViewController {
    
    // TODO: 임시로 지정 해놓은 Label, 실제 화면이 추가되면 제거
    private let feedLabel: UILabel = {
        let label = UILabel()
        label.text = "Feed"
        label.textAlignment = .center
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defineUI()
        self.setConstraints()
    }
    
    private func defineUI() {
        self.view.addSubview(self.feedLabel)
        self.view.backgroundColor = .blue
    }
    
    private func setConstraints() {
        self.feedLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
