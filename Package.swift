// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "swiftwasm",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "swiftwasm", targets: ["swiftwasm"])
    ],
    dependencies: [
        .package(name: "JavaScriptKit", url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.11.1"),
        .package(url: "git@github.com:RedECSEngine/Geometry.git", from: "0.0.2"),
        
        
        /// Swap between these two packages to see issue
        
        .package(url: "git@github.com:RedECSEngine/RedECS.git", .branch("updates-with-jsoncoder")),
//        .package(url: "git@github.com:RedECSEngine/RedECS.git", .branch("updates-without-jsoncoder")),

    ],
    targets: [
        .target(
            name: "swiftwasm",
            dependencies: [
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                .product(name: "Geometry", package: "Geometry"),
                .product(name: "RedECS", package: "RedECS")
            ]
        ),
        .testTarget(
            name: "swiftwasmTests",
            dependencies: ["swiftwasm"]),
    ]
)
