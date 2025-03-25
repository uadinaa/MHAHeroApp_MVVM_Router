import Foundation

class HeroService {
    static let shared = HeroService()

    static func fetchHeroes(completion: @escaping (Result<[Hero], Error>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/uadinaa/AdvancedIOS/main/MHAheroRandomizer/MHAheroRandomizer/allHeroes.json") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            do {
                let heroes = try JSONDecoder().decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(heroes))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
