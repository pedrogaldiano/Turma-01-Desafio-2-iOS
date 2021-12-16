import SwiftUI

struct RepositoriesView: View {
    @State private var searchText = ""
    @StateObject var repo = RepositoriesViewModel()

    var body: some View {

        NavigationView {
            List(0..<30) { _ in
                NavigationLink(destination: PullsView(urlPullsRequests: "String"), label: {
                    RepositoryCell()
                })
            }
            .navigationTitle("Repos em Swift")
                        .navigationBarItems(leading: Button("API Call") {
                            repo.searchSwiftRepoByName()
                            print("api called")
                    })
        }
        .navigationViewStyle(.stack)
        .searchable(text: $searchText)
        .onSubmit(of: .search) {
            print(searchText)
        }
    }

//    var body: some View {
//            if let repos = repo.repositories.items {
//                List { ForEach(repos, id: \.self) { _ in
//                    NavigationLink(destination: PullsView(urlPullsRequests: "aa"), label: {
//                        RepositoryCell()
//
//                    })
//                }
//                .navigationTitle("Repos em Swift")
            //                    .navigationBarItems(leading: Button("API Call") {
            //                        repo.searchSwiftRepoByName()
            //                        print("api called")
            //                })}
//                .navigationViewStyle(.stack)
//                .searchable(text: $searchText)
//                .onSubmit(of: .search) {
//                    print(searchText)
//                }
//            }
//        }
//    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RepositoriesView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
