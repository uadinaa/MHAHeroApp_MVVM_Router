import SwiftUI

struct HeroDetailView: View {
    let hero: Hero
    @State private var isFavorite: Bool = false
    @State private var hearts: [HeartParticle] = [] // Heart particles
    @State private var isAnimating = false // Animation state
    @State private var heartTimer: Timer? // Timer for heart animation

    var body: some View {
        ScrollView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 10) {
                    AsyncImage(url: URL(string: hero.images.lg)) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                    Text(hero.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Full Name: ").bold() + Text(hero.biography.fullName)
                        Text("Aliases: ").bold() + Text(hero.biography.aliases.joined(separator: ", "))
                        Text("First Appearance: ").bold() + Text(hero.biography.firstAppearance)
                        Text("Gender: ").bold() + Text(hero.appearance.gender)
                        Text("Race: ").bold() + Text(hero.appearance.race)
                        Text("Hair Color: ").bold() + Text( hero.appearance.hairColor)
                        Text("Eye Color: ").bold() + Text( hero.appearance.eyeColor)
                        Text("Occupation: ").bold() + Text(hero.work.occupation)
                        Text("Group Affiliation: ").bold() + Text(hero.connections.groupAffiliation)
                        Text("Relatives: ").bold() + Text(hero.connections.relatives)
                    }
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
                .padding()
                
                // Heart Shower Animation
                Canvas { context, size in
                    for heart in hearts {
                        let rect = CGRect(x: heart.x, y: heart.y, width: heart.size, height: heart.size)
                        var resolvedImage = context.resolve(Image(systemName: "heart.fill"))
                        resolvedImage.shading = .color(.red.opacity(heart.opacity))
                        context.draw(resolvedImage, in: rect)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    if isFavorite {
                        FavoriteFunctions.shared.removeFavorite(hero)
                    } else {
                        FavoriteFunctions.shared.addFavorite(hero)
                        startHeartAnimation()
                    }
                    isFavorite.toggle()
                }) {
                    isFavorite ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                }
                .foregroundColor(isFavorite ? .red : .blue)
            }
        }
        .onAppear {
            isFavorite = FavoriteFunctions.shared.getFavorites().contains { $0.id == hero.id }
            startHeartUpdateTimer()
        }
        .onDisappear {
            heartTimer?.invalidate()
        }
    }
    
    func startHeartAnimation() {
        isAnimating = true
        addHearts()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isAnimating = false
            hearts.removeAll()
        }
    }
    
    func addHearts() {
        let startX = UIScreen.main.bounds.width - 40
        let startY = -10

        for _ in 0..<40 {
            let heart = HeartParticle(
                x: startX + CGFloat.random(in: -40...40),
                y: CGFloat(startY),
                size: CGFloat.random(in: 10...30),
                opacity: 1,
                velocity: CGFloat.random(in: 2...5)
            )
            hearts.append(heart)
        }
    }
    
    func updateHearts() {
        for i in hearts.indices {
            hearts[i].y += hearts[i].velocity
            hearts[i].x -= CGFloat.random(in: 0...3)
            hearts[i].x += CGFloat.random(in: -1...2)
            hearts[i].opacity -= 0.015
        }
        hearts.removeAll { $0.y > UIScreen.main.bounds.height * 0.75 }
    }
    
    func startHeartUpdateTimer() {
        heartTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            updateHearts()
        }
    }
}
