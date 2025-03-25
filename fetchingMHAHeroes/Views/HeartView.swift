import SwiftUI

struct HeartView: View {
    var heart: HeartParticle

    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .scaledToFit()
            .frame(width: heart.size, height: heart.size)
            .foregroundColor(.red)
            .position(x: heart.x, y: heart.y)
            .opacity(heart.opacity)
            .shadow(radius: 5)
    }
}
