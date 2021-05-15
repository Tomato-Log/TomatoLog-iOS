
import UIKit

import SnapKit


final class GatewayViewController: UIViewController {
    
    private lazy var gatewayTabView: GatewayTabView = {
        let gatewayTabView = GatewayTabView()
        gatewayTabView.delegate = self
        
        return gatewayTabView
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,
            options: nil
        )
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        return pageViewController
    }()
    
    private let pagingViewControllers = [HomeViewController(), HotViewController(), FeedViewController()]
    private var pageIndex = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.defineUI()
        self.setConstraints()
    }
    
    private func defineUI() {
        self.view.addSubview(self.pageViewController.view)
        self.addChild(self.pageViewController)
        self.pageViewController.didMove(toParent: self)
        self.switchViewController(at: GatewayEndpoint.home.rawValue, animated: false)
        
        self.view.addSubview(self.gatewayTabView)
    }
    
    private func setConstraints() {
        self.pageViewController.view.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.gatewayTabView)
        }
        
        self.gatewayTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func switchViewController(at index: Int, animated: Bool = true) {
        guard
            self.pageIndex != index,
            let viewController = self.pagingViewControllers[safe: index]
        else {
            return
        }
        
        DispatchQueue.main.async {
            self.pageViewController.setViewControllers(
                [viewController],
                direction: self.pageIndex < index ? .forward : .reverse,
                animated: animated
            ) { [weak self] _ in
                self?.pageIndex = index
            }
        }
    }
}


extension GatewayViewController: GatewayTabViewDelegate {
    
    func didSelectedEndpoint(at endpoint: GatewayEndpoint) {
        self.switchViewController(at: endpoint.rawValue)
    }
}


extension GatewayViewController: UIPageViewControllerDataSource {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        return self.pagingViewControllers[safe: self.pageIndex - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        return self.pagingViewControllers[safe: self.pageIndex + 1]
    }
}


extension GatewayViewController: UIPageViewControllerDelegate {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard
            let currentViewController = pageViewController.viewControllers?[safe: 0],
            finished,
            completed
        else {
            return
        }

        self.pagingViewControllers.enumerated().forEach { index, viewController in
            if currentViewController == viewController {
                self.pageIndex = index
            }
        }
    }
}
