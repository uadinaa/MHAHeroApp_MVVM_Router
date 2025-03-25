import SwiftUI

struct Hero: Identifiable, Codable {
    let id: Int
    let name: String
    let slug: String
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
    

    struct Appearance: Codable {
        let gender: String
        let race: String
        let eyeColor: String
        let hairColor: String
    }
    
    struct Biography: Codable {
        let fullName: String
        let aliases: [String]
        let placeOfBirth: String
        let firstAppearance: String
        let publisher: String
    }

    
    struct Work: Codable {
        let occupation: String
        let base: String
    }
    
    struct Connections: Codable {
        let groupAffiliation: String
        let relatives: String
    }
    
    struct Images: Codable {
        let lg: String
    }
}


struct HeartParticle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var size: CGFloat
    var opacity: Double
    var velocity: CGFloat
}
