
import UIKit

import SnapKit


final class HomeViewController: UIViewController {
    
    // TODO: 임시로 지정 해놓은 Label, 실제 화면이 추가되면 제거
    private let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textAlignment = .center
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defineUI()
        self.setConstraints()
    }
    
    private func defineUI() {
        self.view.addSubview(self.homeLabel)
        self.view.backgroundColor = .red
    }
    
    private func setConstraints() {
        self.homeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
