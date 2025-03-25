import SwiftUI
import Foundation

class AppCoordinator{
    let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        let router = Router(navigationController: navigationController)
        let heroListView = HeroListView(router: router)
        let hostingController = UIHostingController(rootView: heroListView)
        navigationController.viewControllers = [hostingController]
        return navigationController
    }
    
}
