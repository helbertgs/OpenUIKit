// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenUIKit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OpenUIKit",
            targets: ["OpenUIKit"]),
        .executable(
            name: "Sample",
            targets: ["Sample"]),
    ],
    dependencies: [
        .package(path: "../CoreGraphics"),
        .package(path: "../GLAD"),
    ],
    targets: [
        .target(
            name: "OpenUIKit",
            dependencies: [
                .product(name: "CoreGraphics", package: "CoreGraphics"),
                .product(name: "GLAD", package: "GLAD")
            ]),
        .executableTarget(
            name: "Sample",
            dependencies: ["OpenUIKit"],
            swiftSettings: [
                .define("_CRT_SECURE_NO_WARNINGS"),
                // .unsafeFlags(["-parse-as-library"]),
            ],
            linkerSettings: [
                .linkedFramework("gdi32", .when(platforms: [.windows])),
                .linkedFramework("openGL32", .when(platforms: [.windows]))
            ]
        )
    ]
)
