import Foundation

final class RepositoryViewModel: ObservableObject {
    @Published var repos: [Item] = []
    @Published var isLoadingPage = false
    private var currentPage = 1

    init() {
        loadMoreContent()
    }

    func loadMoreContentIfNeeded(currentItem item: Item?) {
        guard let item = item else {
            loadMoreContent()
            return
        }
        let thresholdIndex = repos.index(repos.endIndex, offsetBy: -1)
        if repos.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            loadMoreContent()
        }
    }

    private func loadMoreContent(repoName: String = "") {
        guard !isLoadingPage else { return }
        isLoadingPage = true

        guard let url = URL(string: "https://api.github.com/search/" +
                            "repositories?q=\(repoName)language:Swift&sort=stars&page=\(currentPage)")
        else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(Repositories.self, from: data)

                DispatchQueue.main.async {
                    self?.currentPage += 1
                    self?.isLoadingPage = false

                    self?.repos.append(contentsOf: response.items)

                }
            } catch {
                print("ERROR:\n\(error)\n\n")

            }
        }
        task.resume()
    }
}
