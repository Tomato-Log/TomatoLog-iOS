
import UIKit


protocol GatewayTabViewDelegate: AnyObject {
    func didSelectedEndpoint(at endpoint: GatewayEndpoint)
}
