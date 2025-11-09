import ProjectDescription

let project = Project(
    name: "manual_Trigger",
    settings: .settings(
        base: ["MACOSX_DEPLOYMENT_TARGET": "14.0"]
    ),
    targets: [
        // Feature Frameworks
        .target(
            name: "MathFeature",
            destinations: .macOS,
            product: .framework,
            bundleId: "com.abdulahad.MathFeature",
            sources: ["Features/MathFeature/Sources/**/*.swift"]
        ),
        .target(
            name: "StringFeature",
            destinations: .macOS,
            product: .framework,
            bundleId: "com.abdulahad.StringFeature",
            sources: ["Features/StringFeature/Sources/**/*.swift"]
        ),
        .target(
            name: "ArrayFeature",
            destinations: .macOS,
            product: .framework,
            bundleId: "com.abdulahad.ArrayFeature",
            sources: ["Features/ArrayFeature/Sources/**/*.swift"]
        ),

        // Main App
        .target(
            name: "manual_Trigger",
            destinations: .macOS,
            product: .app,
            bundleId: "com.abdulahad.manual-Trigger",
            sources: ["manual_Trigger/manual_Trigger/**/*.swift"],
            resources: ["manual_Trigger/manual_Trigger/**/*.{xcassets,storyboard,xib,xcdatamodeld}"],
            dependencies: [
                .target(name: "MathFeature"),
                .target(name: "StringFeature"),
                .target(name: "ArrayFeature")
            ]
        ),

        // Unit Tests
        .target(
            name: "manual_TriggerTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "com.abdulahad.manual-TriggerTests",
            sources: ["manual_Trigger/manual_TriggerTests/**/*.swift"],
            dependencies: [
                .target(name: "manual_Trigger"),
                .target(name: "MathFeature"),
                .target(name: "StringFeature"),
                .target(name: "ArrayFeature")
            ]
        ),

        // UI Tests for each feature
        .target(
            name: "MathFeatureUITests",
            destinations: .macOS,
            product: .uiTests,
            bundleId: "com.abdulahad.MathFeatureUITests",
            sources: ["Features/MathFeature/UITests/**/*.swift"],
            dependencies: [
                .target(name: "manual_Trigger"),
                .target(name: "MathFeature")
            ]
        ),
        .target(
            name: "StringFeatureUITests",
            destinations: .macOS,
            product: .uiTests,
            bundleId: "com.abdulahad.StringFeatureUITests",
            sources: ["Features/StringFeature/UITests/**/*.swift"],
            dependencies: [
                .target(name: "manual_Trigger"),
                .target(name: "StringFeature")
            ]
        ),
        .target(
            name: "ArrayFeatureUITests",
            destinations: .macOS,
            product: .uiTests,
            bundleId: "com.abdulahad.ArrayFeatureUITests",
            sources: ["Features/ArrayFeature/UITests/**/*.swift"],
            dependencies: [
                .target(name: "manual_Trigger"),
                .target(name: "ArrayFeature")
            ]
        )
    ],
    schemes: [
        .scheme(
            name: "manual_Trigger",
            shared: true,
            buildAction: .buildAction(targets: ["manual_Trigger"]),
            testAction: .testPlans([
                "manual_Trigger/AllUnitTests.xctestplan",
                "manual_Trigger/FirstLegTests.xctestplan",
                "manual_Trigger/SecondLegTests.xctestplan",
                "manual_Trigger/ThirdLegTests.xctestplan"
            ])
        )
    ]
)
