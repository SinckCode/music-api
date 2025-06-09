import Fluent
import Foundation
import Vapor

final class Album: Model, @unchecked Sendable, Content {
    static let schema = "album"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    @Field(key: "artist")
    var artist: String

    @Field(key: "description")
    var description: String

    init() {}

    init(id: UUID? = nil, title: String, artist: String, description: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.description = description
    }
}
