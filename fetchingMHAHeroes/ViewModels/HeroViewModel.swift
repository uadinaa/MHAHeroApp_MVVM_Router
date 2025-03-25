import SwiftUI

//class HeroViewModel: ObservableObject {
//    @Published var heros: [Hero] = []
//    @Published var searchHero = ""
//    
//    // filter searching for the hero
//    var filterHeroes: [Hero] {
//        searchHero.isEmpty ? heros : heros.filter { $0.name.lowercased().contains(searchHero.lowercased())}
//    }
//        
//    // this is for actually getting the heroes from the api
////    func fetchHeroes(){
////        guard let url = URL(string: "https://raw.githubusercontent.com/uadinaa/AdvancedIOS/main/MHAheroRandomizer/MHAheroRandomizer/allHeroes.json")
////        else {return}
////        URLSession.shared.dataTask(with: url){ data, responce, error in
////            if let data = data{
////                do{
////                    let heroes = try JSONDecoder().decode([Hero].self, from: data)
////                    DispatchQueue.main.async {
////                        self.heros = heroes
////                    }
////                } catch{
////                    print("Error decodeing JSON: /\(error)")
////                }
////            }
////                    
////        }.resume()
////    }
////}
//
//    func fetchHeroes() {
//        HeroService.shared.fetchHeroes { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let heroes):
//                    self.heroes = heroes
//                case .failure(let error):
//                    print("Failed to fetch heroes:", error)
//                }
//            }
//        }
//    }
//}


class HeroViewModel: ObservableObject {
    @Published var heroes: [Hero] = []
    @Published var searchText = ""
    @Published var favorites: Set<Int> = []

    var filteredHeroes: [Hero] {
        searchText.isEmpty ? heroes : heroes.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }

    func fetchHeroes() {
        HeroService.fetchHeroes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let heroes):
                    self.heroes = heroes
                case .failure(let error):
                    print("Failed to fetch heroes:", error)
                }
            }
        }
    }
    
    func toggleFavorite(_ id: Int) {
            withAnimation {
                if favorites.contains(id) {
                    favorites.remove(id)
                } else {
                    favorites.insert(id)
                }
            }
        }
}



//// ViewModel to handle favorites
//class HeroViewModel: ObservableObject {
//    @Published var filteredHeroes: [Hero] = []
//    @Published var favorites: Set<Int> = []
//
//    func fetchHeroes() {
//        // Fetch heroes from API
//    }
//
//    func toggleFavorite(_ id: Int) {
//        withAnimation {
//            if favorites.contains(id) {
//                favorites.remove(id)
//            } else {
//                favorites.insert(id)
//            }
//        }
//    }
//}
