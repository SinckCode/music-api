import NIOSSL
import Fluent
import FluentMySQLDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(DatabaseConfigurationFactory.mysql(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? 3306,
        username: Environment.get("DATABASE_USERNAME") ?? "doadmin",
        password: Environment.get("DATABASE_PASSWORD") ?? "contraseña",
        database: Environment.get("DATABASE_NAME") ?? "defaultdb",
        tlsConfiguration: TLSConfiguration.forClient(certificateVerification: .none)
    ), as: .mysql)

    app.migrations.add(CreateAlbum())

    // register routes
    try routes(app)
}
