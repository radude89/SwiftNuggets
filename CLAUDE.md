# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Swift Nuggets is a podcast repository containing code examples and demonstrations for Swift language features. The repository showcases new Swift features, proposals, and best practices through episode-based content.

## Repository Structure

- `episodes/` - Contains directories for each podcast episode with format `SxxExx - Title/`
  - Episode 1: Swift 6.1 features (Swift Package with Package.swift)
  - Episode 2: Swift 6.2 features (Xcode project with .xcodeproj)
  - Episode 3: Swift 6.2 part 2 (Xcode project with .xcodeproj)
- `images/` - Assets including podcast logo
- `README.md` - Comprehensive episode listing with Swift Evolution proposal links

## Development Commands

### Swift Package Projects
For episodes with Package.swift (like Episode 1):
- Build: `swift build`
- Run: `swift run`
- Test: `swift test`

### Xcode Projects
For episodes with .xcodeproj files (Episodes 2 & 3):
- Build: `xcodebuild -project [ProjectName].xcodeproj -scheme [SchemeName] build`
- Open in Xcode: `open [ProjectName].xcodeproj`

## Code Architecture

### Episode Content Structure
Each episode demonstrates specific Swift features:

1. **Episode 1 (Swift 6.1)**: Package traits, trailing commas, member import visibility, String.Index improvements, noncopyable types
2. **Episode 2 (Swift 6.2)**: Nonescapable types, task priority escalation, completion handler sendability
3. **Episode 3 (Swift 6.2 Part 2)**: Duration attosecond representation, isolated deinit, @dynamicMemberLookup enhancements

### Common Patterns
- SwiftUI-based demo apps with ContentView
- Demonstration of cutting-edge Swift features
- Examples of ~Copyable and ~Escapable types
- Swift Evolution proposal implementations

## Content Guidelines

- Episodes focus on new Swift language features and proposals
- Code samples must be compatible with discussed Swift versions
- Each episode includes references to official Swift Evolution proposals
- Examples demonstrate practical usage of new features

## File Naming Conventions

- Episodes: `SxxExx - Title/` format
- Projects follow descriptive naming (e.g., `DemoSwift62`, `DemoSwift62-part2`)
- Swift files use standard naming conventions