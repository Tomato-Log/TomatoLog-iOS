
import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = GatewayViewController()
        
        return true
    }
}
