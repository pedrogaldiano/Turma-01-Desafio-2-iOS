import Foundation

final class PullViewModel: ObservableObject {
    @Published var pulls: [Pull] = []

    func getPullRequestsFromRepo(url: String) {
        print(url)
        guard let url = URL(string: url) else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode([Pull].self, from: data)

                DispatchQueue.main.async {
                    self?.pulls = response
                    print(String(describing: self?.pulls))
                }
            } catch {
                print("ERROR:\n\(error)\n\n")
            }
        }
        task.resume()
    }
}
