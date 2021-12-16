import SwiftUI

struct RepositoriesView: View {
    @State private var searchText = ""
    @StateObject var repos = RepositoriesViewModel()

    var body: some View {

        NavigationView {
            List { ForEach(repos.repositories.items) { repo in
                NavigationLink(destination: PullsView(urlPullsRequests: repo.pullsUrl), label: {
                    RepositoryCell(repo: repo)
                })
            }

            }
            .navigationTitle("Repos em Swift")
            .navigationBarItems(leading: Button("API Call") {
                repos.searchSwiftRepoByName()
                print("api called")
            })
        }
        .navigationViewStyle(.stack)
        .searchable(text: $searchText)
        .onSubmit(of: .search) {
            print(searchText)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RepositoriesView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
