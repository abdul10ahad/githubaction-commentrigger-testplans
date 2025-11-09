import ProjectDescription

let project = Project(
    name: "manual_Trigger",
    targets: [
        .target(
            name: "manual_Trigger",
            destinations: .macOS,
            product: .app,
            bundleId: "com.abdulahad.manual-Trigger",
            sources: ["manual_Trigger/manual_Trigger/**/*.swift"],
            resources: ["manual_Trigger/manual_Trigger/**/*.{xcassets,storyboard,xib,xcdatamodeld}"],
            dependencies: []
        ),
        .target(
            name: "manual_TriggerTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "com.abdulahad.manual-TriggerTests",
            sources: ["manual_Trigger/manual_TriggerTests/**/*.swift"],
            dependencies: [
                .target(name: "manual_Trigger")
            ]
        )
    ],
    schemes: [
        .scheme(
            name: "manual_Trigger",
            shared: true,
            buildAction: .buildAction(targets: ["manual_Trigger"]),
            testAction: .testPlans([
                "manual_Trigger/FirstLegTests.xctestplan",
                "manual_Trigger/SecondLegTests.xctestplan",
                "manual_Trigger/ThirdLegTests.xctestplan"
            ])
        )
    ]
)
