import Foundation

 struct Repositories: Hashable, Codable {
     let items: [Item]
 }

struct Item: Hashable, Codable, Identifiable {
    let id: Int
    let name: String
    let owner: Owner
    let description: String?
    let fullName: String
    let stargazersCount: Int
    let forksCount: Int
}
