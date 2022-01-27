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
        
        
        .package(url: "git@github.com:RedECSEngine/Geometry.git", from: "0.0.1"),
        .package(url: "git@github.com:RedECSEngine/Graphs.git", from: "0.0.1"),
        .package(url: "git@github.com:RedECSEngine/RandomDungeonGenerator.git", from: "0.0.1"),
//        .package(url: "git@github.com:RedECSEngine/RedECS.git", from: "0.0.1"),
        
        .package(name: "RedECS", path: "../RedECS"),
//        .package(name: "RPTrunk", path: "../RPTrunk"),
    ],
    targets: [
        .target(
            name: "swiftwasm",
            dependencies: [
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                .product(name: "Geometry", package: "Geometry"),
                .product(name: "RandomDungeonGenerator", package: "RandomDungeonGenerator"),
//                .product(name: "RPTrunk", package: "RPTrunk"),
                .product(name: "Graphs", package: "Graphs"),
                .product(name: "RedECS", package: "RedECS"),
                .product(name: "RedECSBasicComponents", package: "RedECS"),
            ],
            resources: [
                .copy("Resources")
            ]
        ),
        .testTarget(
            name: "swiftwasmTests",
            dependencies: ["swiftwasm"]),
    ]
)
