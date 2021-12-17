import Foundation

final class PullViewModel: ObservableObject {
    @Published var pulls: [Pull] = []
    @Published var fullName: String = ""
    @Published var isLoading = false
    private var currentPage = 1

    init() {
        loadMoreContent(fullName: fullName)
    }

    func loadMoreContentIfNeeded(currentItem item: Pull?, fullName: String) {
        guard let item = item else {
            loadMoreContent(fullName: fullName)
            return
        }
        let thresholdIndex = pulls.index(pulls.endIndex, offsetBy: -1)
        if pulls.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            loadMoreContent(fullName: fullName)
        }
    }

    func loadMoreContent(fullName: String) {

        guard let url = URL(string: "https://api.github.com/repos/\(fullName)/pulls")
        else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode([Pull].self, from: data)

                DispatchQueue.main.async {
                    self?.currentPage += 1
                    self?.isLoading = false
                    self?.pulls.append(contentsOf: response)

                    print("here\n\n")
                }
            } catch {
                print("ERROR:\n\(error)\n\n")
            }
        }
        task.resume()
    }
}
