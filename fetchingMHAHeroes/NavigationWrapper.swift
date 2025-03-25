import SwiftUI
import UIKit

struct NavigationWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        let router = Router(navigationController: navigationController)
        let heroListView = HeroListView(router: router)
        let hostingController = UIHostingController(rootView: heroListView)
        navigationController.viewControllers = [hostingController]
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}

}
