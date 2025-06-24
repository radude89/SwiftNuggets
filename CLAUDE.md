# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Swift Nuggets is a podcast repository containing code examples and demonstrations for Swift language features. The repository showcases new Swift features, proposals, and best practices through episode-based content.

## Repository Structure

- `episodes/` - Contains directories for each podcast episode with format `SxxExx - Title/`
  - Episode 1: Swift 6.1 features (Swift Package with Package.swift)
  - Episode 2: Swift 6.2 features (Xcode project with .xcodeproj)
  - Episode 3: Swift 6.2 part 2 (Xcode project with .xcodeproj)
  - Episode 4: Swift 6.2 with Xcode 26 (Xcode project with .xcodeproj)
- `images/` - Assets including podcast logo
- `README.md` - Comprehensive episode listing with Swift Evolution proposal links

## Development Commands

### Swift Package Projects
For episodes with Package.swift (like Episode 1):
- Build: `swift build`
- Run: `swift run`
- Test: `swift test`

### Xcode Projects
For episodes with .xcodeproj files (Episodes 2, 3, & 4):
- Build: `xcodebuild -project [ProjectName].xcodeproj -scheme [SchemeName] build`
- Open in Xcode: `open [ProjectName].xcodeproj`
- Specific examples:
  - Episode 2: `open "episodes/S01E02 - New in Swift 6.2/DemoSwift62.xcodeproj"`
  - Episode 3: `open "episodes/S01E03 - New in Swift 6.2/DemoSwift62-part2.xcodeproj"`
  - Episode 4: `open "episodes/S01E04 - New in Swift 6.2/HelloXcode26/HelloXcode26.xcodeproj"`

## Code Architecture

### Episode Content Structure
Each episode demonstrates specific Swift features:

1. **Episode 1 (Swift 6.1)**: Package traits, trailing commas, member import visibility, String.Index improvements, noncopyable types
2. **Episode 2 (Swift 6.2)**: Nonescapable types, task priority escalation, completion handler sendability
3. **Episode 3 (Swift 6.2 Part 2)**: Duration attosecond representation, isolated deinit, @dynamicMemberLookup enhancements
4. **Episode 4 (Xcode 26 & Swift 6.2)**: Comprehensive Swift 6.2 feature playground with all implemented proposals

### Common Patterns
- SwiftUI-based demo apps with ContentView as main interface
- Demonstration of cutting-edge Swift features with practical examples
- Examples of ~Copyable and ~Escapable types showcasing memory management
- Swift Evolution proposal implementations with direct links to proposals
- Playground-style code organization with separate files for different proposals (e.g., Episode 4 has dedicated folders like `0371-IsolatedDeinit/` and `0446-NonescapableTypes/`)
- Interactive demos that execute Swift Evolution examples via `runPlaygroundOnAppear()` function

## Content Guidelines

- Episodes focus on new Swift language features and proposals
- Code samples must be compatible with discussed Swift versions
- Each episode includes references to official Swift Evolution proposals
- Examples demonstrate practical usage of new features
- Follow established episode naming conventions from `.cursor/rules/general-rules.mdc`

## File Naming Conventions

- Episodes: `SxxExx - Title/` format
- Projects follow descriptive naming (e.g., `DemoSwift62`, `DemoSwift62-part2`, `HelloXcode26`)
- Swift files use standard naming conventions

## Git Configuration

- `.DS_Store` files are ignored via `.gitignore`
- Cursor configuration and text scripts are excluded from version control
- Repository follows feature branch workflow (current branch: `feature/ep4`)
- Main branch is `main` for pull requests

## Podcast Resources

- README.md contains comprehensive episode listings with direct Swift Evolution proposal links
- Images directory contains podcast branding assets
- Each episode corresponds to specific Swift versions and Xcode releases
- Links to podcast platforms: YouTube, Apple Podcasts, Spotify