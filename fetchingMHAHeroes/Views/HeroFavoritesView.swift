import SwiftUI

struct HeroFavoritesView: View {
    let router: Router
    @State private var favorites: [Hero] = []
    
    var body: some View {
        List {
            ForEach(favorites) { hero in
                HStack {
                    //  Button(action: {router.showHeroDetail(hero: hero)}) so the navigationLink wraps the hero info, but not the trash button
                    NavigationLink(destination: HeroDetailView(hero: hero)) {
                        HStack {
                            AsyncImage(url: URL(string: hero.images.lg)) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 55, height: 55)
                            
                            VStack(alignment: .leading) {
                                Text(hero.name).font(.headline)
                                Text(hero.biography.fullName).font(.subheadline)
                                Text(hero.work.occupation).font(.caption)
                            }
                        }
                    }
                }
                
                // Remove button
                HStack {
                    Button(action: {
                        FavoriteFunctions.shared.removeFavorite(hero)
                        favorites = FavoriteFunctions.shared.getFavorites()
                    }) {
                        Text("This character is not my fav now")
                    }
                    .padding(.leading, 30)
                }//this makes the sapce between the text and the button  Spacer()
            }
        }
        .navigationTitle("My Favorite Heroes")
        .onAppear {
            favorites = FavoriteFunctions.shared.getFavorites()
        }
    }
}
