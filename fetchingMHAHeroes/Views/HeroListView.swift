import SwiftUI

struct HeroListView: View {
    let router: Router
    @StateObject var viewModel = HeroViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.filteredHeroes) { hero in
                NavigationLink(destination: HeroDetailView(hero: hero)) {
                    HStack {
                        AsyncImage(url: URL(string: hero.images.lg)) { image in
                            image.resizable().scaledToFit()
                                .cornerRadius(10)
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 65, height: 65)

                        VStack(alignment: .leading) {
                            Text(hero.biography.aliases.joined(separator: ", ")).font(.headline)
                            Text(hero.biography.fullName).font(.subheadline)
                            Text(hero.work.occupation).font(.caption)
                        }
                        
                        Spacer()
                        // Favorite heart animation
                        if viewModel.favorites.contains(hero.id) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.purple)
                                .transition(.scale)
                        }
                    }
                }
            }
//            .navigationTitle("My Hero Academia")
//            .navigationBarTitleDisplayMode(.inline) // Prevents the awkward large title shift
            .toolbar {
                ToolbarItem(placement: .principal) { // Centers the title properly
                    Text("MHA Heroes")
                        .font(.largeTitle.bold())
                        .foregroundColor(.primary)
                }
                ToolbarItem(placement: .navigationBarTrailing) { // Keeps favs aligned
                    Button(action: {
                        router.showFavoriteHeros()
                    }) {
                        HStack {
//                            Text("favs")
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                        .foregroundColor(.blue)
                    }
                }
            }
            .searchable(text: $viewModel.searchText)
            .onAppear {
                viewModel.fetchHeroes()
            }
        }
    }
}


