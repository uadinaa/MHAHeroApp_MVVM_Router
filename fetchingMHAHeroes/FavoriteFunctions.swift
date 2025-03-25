import Foundation

class FavoriteFunctions {
    static let shared = FavoriteFunctions() // Singleton
    
    private var favorites: [Hero] = [] // Stores favorite heroes
    
    // Add hero to favorites (avoid duplicates)
    func addFavorite(_ hero: Hero) {
        if !favorites.contains(where: { $0.id == hero.id }) {
            favorites.append(hero)
        }
    }

    // Remove hero from favorites
    func removeFavorite(_ hero: Hero) {
        favorites.removeAll { $0.id == hero.id }
    }

    // Get all favorite heroes
    func getFavorites() -> [Hero] {
        return favorites
    }
}
