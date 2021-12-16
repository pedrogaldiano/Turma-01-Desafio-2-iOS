import SwiftUI

struct RepositoriesView: View {
    @State private var searchText = ""
    @StateObject var repos = RepositoryViewModel()

    var body: some View {

        NavigationView {
            List { ForEach(repos.repositories.items) { repo in
                NavigationLink(destination: PullsView(fullName: repo.fullName, repoName: repo.name), label: {
                    RepositoryCell(repo: repo)
                })
            }

            }
            .navigationTitle("Repos em Swift")
            .navigationBarItems(leading: Button("API Call") {
                repos.searchSwiftRepoByName()
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
