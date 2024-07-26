// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenUIKit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OpenUIKit",
            targets: ["OpenUIKit"]),
        .library(
            name: "OpenCoreGraphics",
            targets: ["OpenCoreGraphics"]),
        .executable(
            name: "Sample",
            targets: ["Sample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/thepotatoking55/CGLFW3.git", branch: "main")
    ],
    targets: [
        .target(
            name: "OpenCoreGraphics"
        ),
        .target(
            name: "OpenUIKit",
            dependencies: [
                "OpenCoreGraphics",
                .product(name: "CGLFW3", package: "CGLFW3")
            ]),
        .executableTarget(
            name: "Sample",
            dependencies: ["OpenUIKit"],
            swiftSettings: [
//                .unsafeFlags(["-parse-as-library"]),
            ]
        ),
        .testTarget(
            name: "OpenUIKitTests",
            dependencies: ["OpenUIKit"]
        ),
    ]
)
