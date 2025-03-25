import SwiftUI
import UIKit

class Router: ObservableObject {
    @Published var navigationPath = [Hero]()

    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showHeroDetail(hero: Hero) {
        let detailView = HeroDetailView(hero: hero)
        let hostingController = UIHostingController(rootView: detailView)
        navigationController.pushViewController(hostingController, animated: true)
//        return HeroDetailView(hero: hero)

    }
    
    func showFavoriteHeros(){
        let favoriteView = HeroFavoritesView(router: self)
        let hostingController = UIHostingController(rootView: favoriteView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
