import Foundation

final class RepositoryViewModel: ObservableObject {
    @Published var repositories = Repositories(items: [])

    func searchSwiftRepoByName(repoName: String = "") {
        guard let url = URL(string: "https://api.github.com/search/" +
                            "repositories?q=\(repoName)language:Swift&sort=stars&page=1")
        else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(Repositories.self, from: data)

                DispatchQueue.main.async {
                    self?.repositories = response
//                    print(String(describing: self?.repositories))
                }
            } catch {
                print("ERROR:\n\(error)\n\n")

            }
        }
        task.resume()
    }
}
