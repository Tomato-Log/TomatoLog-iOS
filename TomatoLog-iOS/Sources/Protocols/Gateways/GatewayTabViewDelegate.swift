
import Foundation


protocol GatewayTabViewDelegate: AnyObject {
    func didSelectedEndpoint(at endpoint: GatewayEndpoint)
}
