# GitHub Actions Test Workflows Demo

This is a simplified iOS/macOS app demonstrating two powerful GitHub Actions workflows for testing:
1. **Comment-Triggered Tests** - Manual control over which test legs to run
2. **Selective Tests** - Automatically run only tests affected by code changes

## Purpose

This demo app shows how to:
- Trigger specific test legs using PR comments
- Use Xcode test plans to organize tests
- Display test status as PR checks
- Allow manual control over which tests run on any PR (including PRs to main)
- **Automatically run only relevant tests** based on changed files (using [XcodeSelectiveTesting](https://github.com/mikeger/XcodeSelectiveTesting))

## Project Structure

```
manual_Trigger/
├── manual_Trigger/
│   ├── manual_TriggerApp.swift       # Main app entry point
│   └── ContentView.swift              # Simple SwiftUI view
├── manual_TriggerTests/
│   └── manual_TriggerTests.swift      # 6 tests divided into 3 legs
├── FirstLegTests.xctestplan          # Math tests (Addition, Multiplication)
├── SecondLegTests.xctestplan         # String tests (Length, Concatenation)
├── ThirdLegTests.xctestplan          # Array tests (Operations, Filtering)
└── .github/workflows/
    ├── comment-triggered-tests.yml    # Comment-triggered workflow
    └── selective-tests.yml            # Automatic selective testing workflow
```

## Tests Organization

The tests are divided into **3 legs**, each with 2 tests:

### First Leg (Math Tests)
- `testMathAddition` - Tests 2 + 2 = 4
- `testMathMultiplication` - Tests 3 × 4 = 12

### Second Leg (String Tests)
- `testStringLength` - Tests string length
- `testStringConcatenation` - Tests string concatenation

### Third Leg (Array Tests)
- `testArrayOperations` - Tests array count and first element
- `testArrayFiltering` - Tests array filtering

## Workflows

This repository includes two different testing workflows:

### Workflow 1: Comment-Triggered Tests (Manual)

Allows manual control over which test legs to run via PR comments.

**When a PR is opened**, the workflow automatically creates **4 pending checks**:
- ⏸ **Manual Tests / First Leg** - Comment "/run-first-leg" to trigger
- ⏸ **Manual Tests / Second Leg** - Comment "/run-second-leg" to trigger
- ⏸ **Manual Tests / Third Leg** - Comment "/run-third-leg" to trigger
- ⏸ **Manual Tests / All Tests** - Comment "/run-all-tests" to trigger

### Workflow 2: Selective Tests (Automatic)

**Automatically runs on every PR** and intelligently determines which tests to run based on the files you changed. Uses [XcodeSelectiveTesting](https://github.com/mikeger/XcodeSelectiveTesting) to:

1. Detect which files changed in your PR
2. Analyze the dependency graph of your project
3. Identify which test targets are affected
4. Run only the relevant tests, skipping unrelated ones

This can **significantly reduce CI time** by avoiding unnecessary test execution.

## How It Works

### Comment-Triggered Tests

**Trigger tests manually** by posting a comment on the PR with one of these commands:

| Command | What it runs |
|---------|-------------|
| `/run-first-leg` | Runs only Math tests (testMathAddition, testMathMultiplication) |
| `/run-second-leg` | Runs only String tests (testStringLength, testStringConcatenation) |
| `/run-third-leg` | Runs only Array tests (testArrayOperations, testArrayFiltering) |
| `/run-all-tests` | Runs all three test legs |

### Selective Tests

**Runs automatically** on every PR. The workflow:

1. Detects files changed in the PR (compared to base branch)
2. Runs XcodeSelectiveTesting on each test plan
3. XcodeSelectiveTesting modifies the test plans to skip unrelated tests
4. Executes only the relevant tests

Example: If you only change `ContentView.swift`, tests that don't depend on `ContentView` will be skipped.

### Check Status Updates

The workflow updates the PR check status in real-time:
- ⏳ **Running** - Test is executing
- ✅ **Success** - Test passed
- ❌ **Failure** - Test failed

## Testing This Demo

### Prerequisites
- Push this repository to GitHub
- Ensure GitHub Actions is enabled for your repository

### Steps to Test

1. **Create a new branch**:
   ```bash
   git checkout -b test-comment-trigger
   ```

2. **Make a small change** (e.g., edit ContentView.swift)

3. **Push and create a PR**:
   ```bash
   git add .
   git commit -m "Test comment trigger workflow"
   git push origin test-comment-trigger
   ```

4. **Open a Pull Request** on GitHub

5. **See pending checks appear** in the PR checks section

6. **Test the commands** by commenting:
   - `/run-test-1` → Only Test 1 runs
   - `/run-test-2` → Only Test 2 runs
   - `/run-all-tests` → Both tests run

7. **Watch the check statuses update** as tests run

## Security

- Only users with **write access** to the repository can trigger tests
- The workflow validates permissions before running any tests
- Unauthorized users will see a failure message if they try to trigger tests

## Workflow Configuration

The workflow ([.github/workflows/comment-triggered-tests.yml](.github/workflows/comment-triggered-tests.yml)) consists of:

1. **create-pending-checks** - Creates pending check runs when PR opens
2. **parse-comment** - Validates permissions and parses the comment command
3. **run-test-1** - Executes testFirst() if requested
4. **run-test-2** - Executes testSecond() if requested
5. **update-all-tests-check** - Updates the "All Tests" check when both tests complete

### Key Features

- Uses GitHub Checks API to create/update check runs
- Runs on GitHub-hosted `macos-latest` runners
- 10-minute timeout per test
- Tests run on the PR's branch (not main)
- Adds a rocket reaction to comments that trigger tests

## Adapting This for Production

To use this pattern in a real project:

1. **Replace simple tests** with your actual test plans
2. **Adjust test commands** in xcodebuild (add test plans, schemes, etc.)
3. **Add more test legs** by duplicating the run-test jobs
4. **Use self-hosted runners** if needed (change `runs-on: macos-latest` to `runs-on: [self-hosted, ui-tests]`)
5. **Increase timeout** for longer tests (change `timeout-minutes: 10`)

## Example: How This Maps to Production

| Demo | Production Equivalent |
|------|----------------------|
| `/run-test-1` | `/run-first-leg` → UITestsFirstLeg |
| `/run-test-2` | `/run-second-leg` → UITestsSecondLeg |
| `/run-all-tests` | `/run-all-tests` → All 4 legs + Uninstall |
| 2 simple tests | 4 test legs + Uninstall test |
| 10 min timeout | 45 min timeout |
| GitHub-hosted runner | Self-hosted runner |

## Troubleshooting

### Check doesn't appear in PR
- Make sure the workflow file is in the `main` branch before creating the PR
- Ensure GitHub Actions is enabled in repository settings

### Tests don't trigger
- Verify you have write access to the repository
- Check the Actions tab for error messages
- Ensure the comment exactly matches the command format

### Tests fail
- Check the Actions tab for detailed logs
- Verify the Xcode version and simulator are available
- Ensure the scheme name matches (`manual_Trigger`)

## License

This is a demo project for educational purposes.
