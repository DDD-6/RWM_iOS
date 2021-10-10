import ProjectDescription

let project = Project(
    name: "RWM",
    organizationName: "com.6hc",
    targets: [
        Target(
            name: "RWM",
            platform: .iOS,
            product: .app,
            bundleId: "com.6hc.RWM",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: .iphone),
            infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
            sources: ["Sources/**"],
            resources: [
                "Resources/**"
            ],
            actions: [
                TargetAction.pre(
                    script: "${PODS_ROOT}/SwiftLint/swiftlint",
                    name: "SwiftLint"
                )
            ],
            dependencies: [
                .cocoapods(path: ".")
            ]
        )
    ]
)
