
import UIKit

import SnapKit


final class GatewayViewController: UIViewController {
    
    private lazy var gatewayTabView: GatewayTabView = {
        let gatewayTabView = GatewayTabView()
        gatewayTabView.delegate = self
        
        return gatewayTabView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defineUI()
        self.setConstraints()
    }
    
    private func defineUI() {
        self.view.addSubview(self.gatewayTabView)
    }
    
    private func setConstraints() {
        self.gatewayTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}


extension GatewayViewController: GatewayTabViewDelegate {
    
    func didSelectedEndpoint(at endpoint: GatewayEndpoint) {
        switch endpoint {
        case .home:
            break
        case .hot:
            break
        case .feed:
            break
        }
    }
}
