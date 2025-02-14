// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.18.0"),
        .package(url: "https://github.com/BarredEwe/Prefire", from: "3.6.0"),
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                "Prefire",
            ]
        ),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: [
                "AppFeature",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            plugins: [
                .plugin(name: "PrefireTestsPlugin", package: "Prefire"),
            ]
        )
    ]
)
