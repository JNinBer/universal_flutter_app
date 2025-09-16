# Repository Guidelines

## Project Structure & Module Organization
- App code in `lib/` (entry: `lib/main.dart`); app wiring in `lib/src/app/**` (routes, theming) and features in `lib/src/module/**` (home, auth, search, chat).
- Shared packages live in `packages/` (`common`, `settings`); feature packages in `modules/` (`auth`, `home`). Each package has its own `pubspec.yaml`, `lib/`, and `test/`.
- Tests exist at the root `test/` and within each package’s `test/` directory.
- Tooling/config: `melos.yaml` (workspace & scripts), `analysis_options.yaml` (lints), `.fvmrc` (Flutter 3.35.2), `combine_coverage.sh` (coverage merge).

## Build, Test, and Development Commands
- Bootstrap workspace: `melos bootstrap`
- Analyze all packages: `melos run analyze`
- Run all tests: `melos run test`
- Combine coverage after tests: `melos run gen_coverage` → `coverage_report/lcov.info`
- Run the app: `fvm flutter run -d <device>` (or `flutter run` if not using FVM)
- Format code: `flutter format .` (optional hook: `chmod +x pre-commit && ln -sf ../pre-commit .git/hooks/pre-commit`)

## Coding Style & Naming Conventions
- Follow `flutter_lints` (see `analysis_options.yaml`); fix analyzer issues before commit.
- 2-space indentation; always run `flutter format`.
- Files: `lower_snake_case.dart`; classes/types: `PascalCase`; members/functions: `lowerCamelCase`.
- Cubit/State naming: `<feature>_cubit.dart`, `<feature>_state.dart` (e.g., `lib/src/module/search/cubit/search_cubit.dart`).

## Testing Guidelines
- Use `flutter_test`; name files `*_test.dart`.
- Place tests in each package’s `test/` and in root `test/` for app-level tests.
- Prefer widget tests for UI (`testWidgets`) and unit tests for Cubits/services; see `test/widget_test.dart`.
- Generate coverage via `melos run test` then `melos run gen_coverage`.

## Commit & Pull Request Guidelines
- History mixes styles; prefer Conventional Commits: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`.
- Before pushing: `melos bootstrap`, `melos run analyze`, `melos run test` (all green).
- PRs: include clear description, linked issues, screenshots for UI changes, and notes on tests/coverage.

## Security & Configuration Tips
- Use FVM for consistent Flutter (`.fvmrc` pins 3.35.2).
- Do not commit secrets (e.g., Sentry DSN); pass via `--dart-define` or CI secrets.
