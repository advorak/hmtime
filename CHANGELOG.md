# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.2] - 2024-03-14

### Added

- Packaged this gem as a proper gem using a proper gemspec
- Added unit tests using minitest
- LICENSE.txt MIT License file
- README.md file

### Removed

- The ability to multiply and divide -- in future, must be thoughtful about how these functions work if reimplemented

### Changed

- HMTime#== only compares two HMTime objects based upon their @minutes variable
- Released as version 0.1.2

### Fixed

- Handle negative time in HMTime#hours, HMTime#minutes, and HMTime#time
