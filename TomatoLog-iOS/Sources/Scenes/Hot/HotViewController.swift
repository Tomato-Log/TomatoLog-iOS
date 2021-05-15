
import UIKit

import SnapKit


final class HotViewController: UIViewController {
    
    // TODO: 임시로 지정 해놓은 Label, 실제 화면이 추가되면 제거
    private let hotLabel: UILabel = {
        let label = UILabel()
        label.text = "Hot"
        label.textAlignment = .center
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defineUI()
        self.setConstraints()
    }
    
    private func defineUI() {
        self.view.addSubview(self.hotLabel)
        self.view.backgroundColor = .green
    }
    
    private func setConstraints() {
        self.hotLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
